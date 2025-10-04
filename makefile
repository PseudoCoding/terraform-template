# Terraform Makefile
# Usage: make <target> ENV=<environment>
# Example: make plan ENV=dev

# Default environment if not specified
ENV ?= dev

# Terraform binary
TERRAFORM := terraform

# Configuration files
TFVARS_FILE := config/$(ENV).tfvars
BACKEND_CONFIG := config/$(ENV)-backend.tfvars

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

# Validate environment
.PHONY: validate-env
validate-env:
	@if [ ! -f "$(TFVARS_FILE)" ]; then \
		echo "$(RED)Error: Configuration file $(TFVARS_FILE) not found$(NC)"; \
		echo "Available environments:"; \
		ls config/*.tfvars | sed 's/config\///g' | sed 's/.tfvars//g' | sed 's/^/  - /g'; \
		exit 1; \
	fi

# Initialize Terraform
.PHONY: init
init: validate-env
	@echo "$(BLUE)Initializing Terraform for $(ENV) environment...$(NC)"
	$(TERRAFORM) init $(if $(wildcard $(BACKEND_CONFIG)),-backend-config=$(BACKEND_CONFIG),)

# Format Terraform files
.PHONY: fmt
fmt:
	@echo "$(BLUE)Formatting Terraform files...$(NC)"
	$(TERRAFORM) fmt -recursive

# Validate Terraform configuration
.PHONY: validate
validate: init
	@echo "$(BLUE)Validating Terraform configuration...$(NC)"
	$(TERRAFORM) validate

# Plan Terraform changes
.PHONY: plan
plan: validate-env init
	@echo "$(BLUE)Planning Terraform changes for $(ENV) environment...$(NC)"
	$(TERRAFORM) plan -var-file=$(TFVARS_FILE) -out=tfplan-$(ENV)

# Apply Terraform changes
.PHONY: apply
apply: validate-env
	@echo "$(YELLOW)Applying Terraform changes for $(ENV) environment...$(NC)"
	@if [ -f "tfplan-$(ENV)" ]; then \
		$(TERRAFORM) apply tfplan-$(ENV); \
	else \
		echo "$(YELLOW)No plan file found. Running plan and apply...$(NC)"; \
		$(TERRAFORM) apply -var-file=$(TFVARS_FILE); \
	fi

# Destroy Terraform resources
.PHONY: destroy
destroy: validate-env
	@echo "$(RED)Destroying Terraform resources for $(ENV) environment...$(NC)"
	@echo "$(YELLOW)WARNING: This will destroy all resources in $(ENV) environment!$(NC)"
	@read -p "Are you sure? (yes/no): " confirm && [ "$$confirm" = "yes" ] || exit 1
	$(TERRAFORM) destroy -var-file=$(TFVARS_FILE)

# Show Terraform state
.PHONY: show
show: validate-env init
	@echo "$(BLUE)Showing Terraform state for $(ENV) environment...$(NC)"
	$(TERRAFORM) show

# List Terraform state resources
.PHONY: state-list
state-list: validate-env init
	@echo "$(BLUE)Listing Terraform state resources for $(ENV) environment...$(NC)"
	$(TERRAFORM) state list

# Refresh Terraform state
.PHONY: refresh
refresh: validate-env init
	@echo "$(BLUE)Refreshing Terraform state for $(ENV) environment...$(NC)"
	$(TERRAFORM) refresh -var-file=$(TFVARS_FILE)

# Import existing resource
.PHONY: import
import: validate-env init
	@if [ -z "$(RESOURCE)" ] || [ -z "$(ID)" ]; then \
		echo "$(RED)Error: RESOURCE and ID must be specified$(NC)"; \
		echo "Usage: make import ENV=$(ENV) RESOURCE=<terraform_resource> ID=<resource_id>"; \
		exit 1; \
	fi
	@echo "$(BLUE)Importing resource $(RESOURCE) with ID $(ID) for $(ENV) environment...$(NC)"
	$(TERRAFORM) import -var-file=$(TFVARS_FILE) $(RESOURCE) $(ID)

# Generate dependency graph
.PHONY: graph
graph: validate-env init
	@echo "$(BLUE)Generating dependency graph for $(ENV) environment...$(NC)"
	$(TERRAFORM) graph | dot -Tpng > terraform-graph-$(ENV).png
	@echo "$(GREEN)Graph saved as terraform-graph-$(ENV).png$(NC)"

# Clean up temporary files
.PHONY: clean
clean:
	@echo "$(BLUE)Cleaning up temporary files...$(NC)"
	rm -f tfplan-*
	rm -f terraform-graph-*.png
	rm -f .terraform.lock.hcl
	rm -rf .terraform/

# Full clean (including state files) - USE WITH CAUTION
.PHONY: clean-all
clean-all: clean
	@echo "$(RED)WARNING: This will remove all Terraform state files!$(NC)"
	@read -p "Are you sure? (yes/no): " confirm && [ "$$confirm" = "yes" ] || exit 1
	rm -f terraform.tfstate*

# Security scan with tfsec (requires tfsec to be installed)
.PHONY: security-scan
security-scan:
	@if command -v tfsec >/dev/null 2>&1; then \
		echo "$(BLUE)Running security scan...$(NC)"; \
		tfsec .; \
	else \
		echo "$(YELLOW)tfsec not found. Install with: brew install tfsec$(NC)"; \
	fi

# Cost estimation with infracost (requires infracost to be installed)
.PHONY: cost
cost: validate-env init
	@if command -v infracost >/dev/null 2>&1; then \
		echo "$(BLUE)Estimating costs for $(ENV) environment...$(NC)"; \
		infracost breakdown --path . --terraform-var-file $(TFVARS_FILE); \
	else \
		echo "$(YELLOW)infracost not found. Install from: https://www.infracost.io/docs/$(NC)"; \
	fi

# Check Terraform and provider versions
.PHONY: version
version:
	@echo "$(BLUE)Terraform version:$(NC)"
	$(TERRAFORM) version

# Help target
.PHONY: help
help:
	@echo "$(GREEN)Terraform Makefile Commands:$(NC)"
	@echo ""
	@echo "$(BLUE)Basic Commands:$(NC)"
	@echo "  make init ENV=<env>        - Initialize Terraform"
	@echo "  make plan ENV=<env>        - Plan changes"
	@echo "  make apply ENV=<env>       - Apply changes"
	@echo "  make destroy ENV=<env>     - Destroy resources"
	@echo ""
	@echo "$(BLUE)Utility Commands:$(NC)"
	@echo "  make fmt                   - Format Terraform files"
	@echo "  make validate ENV=<env>    - Validate configuration"
	@echo "  make show ENV=<env>        - Show current state"
	@echo "  make state-list ENV=<env>  - List state resources"
	@echo "  make refresh ENV=<env>     - Refresh state"
	@echo "  make version               - Show Terraform version"
	@echo ""
	@echo "$(BLUE)Advanced Commands:$(NC)"
	@echo "  make import ENV=<env> RESOURCE=<resource> ID=<id> - Import existing resource"
	@echo "  make graph ENV=<env>       - Generate dependency graph"
	@echo "  make security-scan         - Run security scan (requires tfsec)"
	@echo "  make cost ENV=<env>        - Estimate costs (requires infracost)"
	@echo ""
	@echo "$(BLUE)Cleanup Commands:$(NC)"
	@echo "  make clean                 - Clean temporary files"
	@echo "  make clean-all             - Clean all files including state (DANGER)"
	@echo ""
	@echo "$(BLUE)Available Environments:$(NC)"
	@ls config/*.tfvars 2>/dev/null | sed 's/config\///g' | sed 's/.tfvars//g' | sed 's/^/  - /g' || echo "  No .tfvars files found in config/"
	@echo ""
	@echo "$(YELLOW)Example: make plan ENV=dev$(NC)"

# Default target
.DEFAULT_GOAL := help