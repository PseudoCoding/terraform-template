# =============================================================================
# DEVELOPMENT ENVIRONMENT CONFIGURATION
# =============================================================================
# This file contains environment-specific variables for the development environment.
# Copy this file and modify values for your specific deployment.

# Project Configuration
project_name = "myproject"
environment  = "dev"
location     = "East US"

# Common Tags
common_tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
  Project     = "myproject"
  Owner       = "DevTeam"
}

# Network Configuration
vnet_address_space = ["10.0.0.0/16"]
subnet_address_prefixes = {
  web  = ["10.0.1.0/24"]
  app  = ["10.0.2.0/24"]
  data = ["10.0.3.0/24"]
  mgmt = ["10.0.10.0/24"]
}

# Compute Configuration
vm_size = "Standard_B2s" # Small size for dev

# Database Configuration
database_sku = "Basic" # Basic tier for dev

# Example sensitive variables (set via environment variables or Azure Key Vault)
# sql_admin_username = "sqladmin"
# sql_admin_password = "" # Set via TF_VAR_sql_admin_password environment variable