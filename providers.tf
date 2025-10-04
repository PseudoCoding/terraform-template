# =============================================================================
# TERRAFORM PROVIDERS
# =============================================================================
# This file contains ONLY Terraform provider configurations.
# 
# Providers are plugins that allow Terraform to interact with cloud platforms,
# SaaS providers, and other APIs. This file defines which providers to use
# and their configuration settings.
#
# Use this file for:
# - Provider version constraints and requirements
# - Provider-specific configuration settings
# - Authentication and connection settings
# - Feature flags and provider options
# - Multiple provider configurations (aliases)
# - Required provider declarations
#
# DO NOT put other Terraform configuration in this file such as:
# - Resource definitions (use appropriate resource files)
# - Data sources (use data.tf)
# - Variable declarations (use variables.tf)
# - Output values (use outputs.tf)
# - Backend configuration (use backend.tf)
#
# Provider Configuration Examples:
# 
# terraform {
#   required_version = ">= 1.5"
#   
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.0"
#     }
#     random = {
#       source  = "hashicorp/random"
#       version = "~> 3.1"
#     }
#   }
# }
#
# provider "azurerm" {
#   features {
#     resource_group {
#       prevent_deletion_if_contains_resources = false
#     }
#     
#     key_vault {
#       purge_soft_delete_on_destroy    = true
#       recover_soft_deleted_key_vaults = true
#     }
#   }
# }
#
# # Alternative provider configuration for different subscription
# provider "azurerm" {
#   alias           = "secondary"
#   subscription_id = var.secondary_subscription_id
#   
#   features {}
# }
# =============================================================================

# Add your provider configurations below this line