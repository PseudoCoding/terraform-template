# =============================================================================
# TEST ENVIRONMENT CONFIGURATION
# =============================================================================
# This file contains environment-specific variables for the test environment.
# Copy this file and modify values for your specific deployment.

# Project Configuration
project_name = "myproject"
environment  = "test"
location     = "East US"

# Common Tags
common_tags = {
  Environment = "test"
  ManagedBy   = "Terraform"
  Project     = "myproject"
  Owner       = "QATeam"
}

# Network Configuration
vnet_address_space = ["10.2.0.0/16"]
subnet_address_prefixes = {
  web  = ["10.2.1.0/24"]
  app  = ["10.2.2.0/24"]
  data = ["10.2.3.0/24"]
  mgmt = ["10.2.10.0/24"]
}

# Compute Configuration
vm_size = "Standard_B1s" # Small size for testing

# Database Configuration
database_sku = "Basic" # Basic tier for test

# Example sensitive variables (set via environment variables or Azure Key Vault)
# sql_admin_username = "sqladmin"
# sql_admin_password = "" # Set via TF_VAR_sql_admin_password environment variable
