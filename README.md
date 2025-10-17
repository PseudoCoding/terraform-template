# Terraform Template Repository

A well-structured Terraform template repository designed for managing your infrastructure..

## 🤖 CI/CD Pipeline

This template includes GitHub Actions workflows for automated Terraform operations:

### Validation Workflow (`validate.yml`)
**Triggers**: All pushes and pull requests
- ✅ **Format checking** - Ensures code is properly formatted
- ✅ **Terraform validation** - Validates syntax and configuration
- ✅ **Security scanning** - Runs tfsec for security best practices
- ✅ **PR comments** - Provides feedback directly on pull requests

### Full CI/CD Pipeline (`terraform.yml`)
**Triggers**: Main branch pushes, PRs, manual dispatch
- 🔍 **Multi-environment planning** - Plans for dev, stage, test environments
- 🛡️ **Advanced security scanning** - tfsec and Checkov integration
- 💰 **Cost estimation** - Infracost integration for cost analysis
- 🚀 **Automated deployment** - Apply changes to specified environments
- 🗑️ **Controlled destruction** - Manual destroy capability with confirmations

### Required Secrets
For the full pipeline, configure these GitHub secrets:
```
AZURE_CLIENT_ID          # Service Principal Client ID
AZURE_CLIENT_SECRET      # Service Principal Secret
AZURE_SUBSCRIPTION_ID    # Azure Subscription ID
AZURE_TENANT_ID          # Azure Tenant ID
INFRACOST_API_KEY        # Infracost API key (optional, for cost estimation)
```

### Manual Workflow Dispatch
The full pipeline supports manual execution with options for:
- **Environment selection**: dev, stage, test, prod
- **Action selection**: plan, apply, destroy

## 📁 File Organization Guidelines

### ✅ What Goes Where as code (IaC) deployments with a **bias towards Azure** cloud platform.

## 🎯 Overview

This template provides a standardized, scalable foundation for Terraform projects. While the structure is cloud-agnostic, all examples, documentation, and default configurations are **optimized for Microsoft Azure**.

## 🏗️ Project Structure

```
terraform-template/
├── README.md                 # This file
├── makefile                  # Automation commands for Terraform operations
├── LICENSE                   # Project license
│
├── config/                   # Environment-specific configurations
│   ├── dev.tfvars           # Development environment variables
│   ├── stage.tfvars         # Staging environment variables
│   ├── test.tfvars          # Test environment variables
│   └── prod.tfvars          # Production environment variables
│
├── backend.tf               # Terraform backend configuration (state storage)
├── providers.tf             # Provider configurations and version constraints
├── variables.tf             # Input variable declarations
├── outputs.tf               # Output value definitions
├── data.tf                  # Data source references (existing resources)
├── main.tf                  # Miscellaneous resources without dedicated files
│
├── compute.tf               # Compute resources (VMs, containers, functions)
├── networking.tf            # Network resources (VNets, NSGs, load balancers)
├── storage.tf               # Storage resources (storage accounts, containers)
└── database.tf              # Database resources (SQL, CosmosDB, caches)
```

## Quick Start

### Prerequisites

- [Terraform](https://terraform.io/downloads.html) >= 1.5
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) (for Azure authentication)
- [Make](https://www.gnu.org/software/make/) (for automation commands)

### Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/PseudoCoding/terraform-template.git
   cd terraform-template
   ```

2. **Authenticate with Azure:**
   ```bash
   az login
   ```

3. **Configure your environment:**
   ```bash
   # Edit the appropriate config file
   vim config/dev.tfvars
   ```

4. **Initialize and plan:**
   ```bash
   make init ENV=dev
   make plan ENV=dev
   ```

5. **Apply changes:**
   ```bash
   make apply ENV=dev
   ```

## Makefile Commands

This template includes a comprehensive Makefile for common Terraform operations:

| Command | Description |
|---------|-------------|
| `make help` | Show all available commands |
| `make init ENV=<env>` | Initialize Terraform for specified environment |
| `make plan ENV=<env>` | Plan changes for specified environment |
| `make apply ENV=<env>` | Apply changes for specified environment |
| `make destroy ENV=<env>` | Destroy resources (with confirmation) |
| `make fmt` | Format all Terraform files |
| `make validate ENV=<env>` | Validate configuration |
| `make clean` | Clean temporary files |

**Example:**
```bash
make plan ENV=dev     # Plan for development environment
make apply ENV=prod   # Apply to production environment
```

## Environment Management

The template supports multiple environments through the `config/` directory:

- **`dev.tfvars`** - Development environment
- **`stage.tfvars`** - Staging environment  
- **`test.tfvars`** - Testing environment
- **`prod.tfvars`** - Production environment

Each file contains environment-specific variables that override defaults.

## File Organization Guidelines

### What Goes Where

- **`backend.tf`** - Only backend configuration (state storage)
- **`providers.tf`** - Only provider configurations and version constraints
- **`variables.tf`** - Only variable declarations
- **`outputs.tf`** - Only output value definitions
- **`data.tf`** - Only data sources (references to existing resources)
- **`main.tf`** - Resources that don't fit in other categories
- **`compute.tf`** - VMs, containers, functions, AKS clusters
- **`networking.tf`** - VNets, subnets, NSGs, load balancers, DNS
- **`storage.tf`** - Storage accounts, blob containers, file shares
- **`database.tf`** - SQL databases, CosmosDB, Redis cache

### Design Principles

1. **Single Responsibility** - Each file has one clear purpose
2. **Environment Agnostic** - Core files work across all environments
3. **Azure Optimized** - Examples and defaults target Azure services
4. **Scalable Structure** - Easy to extend as infrastructure grows
5. **Team Friendly** - Clear organization reduces merge conflicts

## Azure Focus

This template is **biased towards Azure** with:

- **Azure Resource Manager (ARM) provider** examples
- **Azure-specific resource naming** conventions
- **Azure best practices** in documentation
- **Azure CLI integration** for authentication
- **Azure Storage backend** configuration examples

### Common Azure Resources Covered

- **Compute**: Virtual Machines, Container Instances, App Services, AKS
- **Networking**: Virtual Networks, Subnets, NSGs, Load Balancers
- **Storage**: Storage Accounts, Blob Storage, File Shares
- **Database**: SQL Database, CosmosDB, Redis Cache
- **Security**: Key Vault, Managed Identity, RBAC

## Customization

### Adding New Environments

1. Create a new `.tfvars` file in the `config/` directory
2. Define environment-specific variables
3. Use with makefile: `make plan ENV=<your-env>`

### Adding New Resource Categories

1. Create a new `.tf` file (e.g., `security.tf`)
2. Add comprehensive documentation header
3. Update this README with the new file purpose

### Adapting for Other Cloud Providers

While optimized for Azure, this template can be adapted for AWS or GCP:

1. Update provider configurations in `providers.tf`
2. Replace Azure examples with target cloud provider
3. Update documentation and variable names accordingly

## Best Practices

- **Use descriptive resource names** with environment prefixes
- **Apply consistent tagging** across all resources
- **Use remote state** for team collaboration (not local backend)
- **Implement proper RBAC** and security policies
- **Regular state file backups** and disaster recovery planning
- **Code reviews** for all infrastructure changes

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Follow the established file organization patterns
4. Update documentation as needed
5. Commit changes (`git commit -m 'Add amazing feature'`)
6. Push to branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For questions or issues:

1. Check the [Issues](https://github.com/PseudoCoding/terraform-template/issues) page
2. Review the Terraform [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
3. Consult [Azure documentation](https://docs.microsoft.com/en-us/azure/)

---

**Note**: This template prioritizes Azure cloud services. For other cloud providers, consider adapting the examples and configurations accordingly.