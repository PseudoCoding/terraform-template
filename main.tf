# =============================================================================
# MAIN RESOURCES
# =============================================================================
# This file contains Terraform resources that do NOT have a dedicated file.
# 
# Use this file for miscellaneous resources that don't fit into the other
# specialized files, or for small resources that don't warrant their own file.
# As your infrastructure grows, consider moving resources to dedicated files
# for better organization.
#
# Use this file for:
# - Resource groups (foundational resources)
# - Small utility resources that don't fit elsewhere
# - Resources that are used across multiple categories
# - Temporary resources during development
# - Resources that don't have enough related items for a dedicated file
#
# DO NOT put resources here if they have a dedicated file:
# - Compute resources (use compute.tf)
# - Networking resources (use networking.tf or vnet.tf)
# - Storage resources (use storage.tf)
# - Database resources (use database.tf)
# - Data sources (use data.tf)
# - Backend configuration (use backend.tf)
# - Provider configuration (use providers.tf)
# - Variables (use variables.tf)
# - Outputs (use outputs.tf)
#
# Consider creating dedicated files when you have 3+ related resources.
#
# Common Resources for main.tf:
# 
# resource "azurerm_resource_group" "main" {
#   name     = "rg-${var.project_name}-${var.environment}"
#   location = var.location
#   
#   tags = var.common_tags
# }
#
# resource "random_id" "suffix" {
#   byte_length = 4
# }
#
# resource "azurerm_user_assigned_identity" "main" {
#   name                = "identity-${var.environment}"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.main.name
# }
# =============================================================================

# Add miscellaneous resources below this line