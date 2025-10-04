# =============================================================================
# PRODUCTION ENVIRONMENT CONFIGURATION
# =============================================================================
# This file contains environment-specific variables for the production environment.
# Copy this file and modify values for your specific deployment.

# Project Configuration
project_name = "myproject"
environment  = "prod"
location     = "East US"

# Common Tags
common_tags = {
  Environment = "production"
  ManagedBy   = "Terraform"
  Project     = "myproject"
  Owner       = "OpsTeam"
}

# Network Configuration
vnet_address_space = ["10.10.0.0/16"]
subnet_address_prefixes = {
  web     = ["10.10.1.0/24"]
  app     = ["10.10.2.0/24"]
  data    = ["10.10.3.0/24"]
  mgmt    = ["10.10.10.0/24"]
}

# Compute Configuration
vm_size = "Standard_D4s_v3"  # Larger size for production

# Database Configuration
database_sku = "P2"  # Premium tier for production

# Example sensitive variables (set via environment variables or Azure Key Vault)
# sql_admin_username = "sqladmin"
# sql_admin_password = "" # Set via TF_VAR_sql_admin_password environment variable