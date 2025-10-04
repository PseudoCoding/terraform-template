# =============================================================================
# STORAGE RESOURCES
# =============================================================================
# This file contains ONLY storage-related Terraform resources.
# 
# This includes all storage infrastructure components such as storage accounts,
# blob containers, file shares, queues, and storage-related security settings.
# Keep all storage resources centralized here for better organization.
#
# Use this file for:
# - Storage accounts and blob storage
# - File shares and queues
# - Storage containers and blob access policies
# - Storage security settings and encryption
# - Backup vaults and recovery services
# - Content Delivery Networks (CDN) for storage
# - Storage sync services
# - Data Lake storage configurations
# - Archive and backup storage
#
# DO NOT put non-storage resources in this file such as:
# - Virtual machines (use compute.tf)
# - Networking resources (use networking.tf)
# - Databases (use database.tf)
# - Data sources (use data.tf)
# - Variables or outputs (use variables.tf/outputs.tf)
#
# Storage Resource Examples:
# 
# resource "azurerm_storage_account" "main" {
#   name                     = "st${var.project_name}${var.environment}${random_id.suffix.hex}"
#   resource_group_name      = azurerm_resource_group.main.name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   
#   tags = var.common_tags
# }
#
# resource "azurerm_storage_container" "main" {
#   name                  = "content"
#   storage_account_name  = azurerm_storage_account.main.name
#   container_access_type = "private"
# }
#
# resource "azurerm_storage_share" "main" {
#   name                 = "fileshare"
#   storage_account_name = azurerm_storage_account.main.name
#   quota                = 50
# }
# =============================================================================

# Add your storage resources below this line