# =============================================================================
# STAGING ENVIRONMENT CONFIGURATION
# =============================================================================
# This file contains environment-specific variables for the staging environment.
# Copy this file and modify values for your specific deployment.

# Project Configuration
project_name = "myproject"
environment  = "stage"
location     = "East US"

# Common Tags
common_tags = {
  Environment = "staging"
  ManagedBy   = "Terraform"
  Project     = "myproject"
  Owner       = "DevTeam"
}

# Network Configuration
vnet_address_space = ["10.1.0.0/16"]
subnet_address_prefixes = {
  web     = ["10.1.1.0/24"]
  app     = ["10.1.2.0/24"]
  data    = ["10.1.3.0/24"]
  mgmt    = ["10.1.10.0/24"]
}

# Compute Configuration
vm_size = "Standard_D2s_v3"  # Medium size for staging

# Database Configuration
database_sku = "S1"  # Standard tier for staging

# Example sensitive variables (set via environment variables or Azure Key Vault)
# sql_admin_username = "sqladmin"
# sql_admin_password = "" # Set via TF_VAR_sql_admin_password environment variable
