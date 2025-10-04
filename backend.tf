# =============================================================================
# TERRAFORM BACKEND CONFIGURATION
# =============================================================================
# This file contains ONLY the Terraform backend configuration.
# 
# The backend determines where Terraform stores its state file and how it
# locks the state during operations. This is critical for team collaboration
# and preventing state corruption.
#
# Use this file for:
# - Configuring remote state storage (Azure Storage, AWS S3, etc.)
# - Setting up state locking mechanisms
# - Defining backend-specific settings and authentication
#
# DO NOT put other Terraform configuration in this file such as:
# - Provider configurations (use providers.tf)
# - Resource definitions (use appropriate resource files)
# - Variable declarations (use variables.tf)
# - Data sources (use data.tf)
#
# Backend Configuration Examples:
# 
# Azure Storage Account (Recommended for prodline environments):
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "terraform-state-rg"
#     storage_account_name = "terraformstate12345"
#     container_name       = "tfstate"
#     key                  = "terraform.tfstate"
#   }`
# }
# =============================================================================

# For local use only
# Ideal for testing purposes only
terraform {
  backend "local" {}
}