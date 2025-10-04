# =============================================================================
# DATA SOURCES
# =============================================================================
# This file contains only Terraform data sources (data blocks).
# 
# Data sources are used to reference existing resources that are NOT managed
# by this Terraform configuration. They allow you to fetch information about
# resources that already exist in your infrastructure or are managed elsewhere.
#
# Use this file for:
# - Referencing existing VNets, subnets, security groups, resource groups
# - Looking up VM image IDs, availability zones
# - Fetching information from other Terraform state files (remote state)
# - Querying Azure provider APIs for existing resources
# - Getting subscription/tenant information
#
# DO NOT put resource blocks (resource "...") in this file.
# Resources that create/manage infrastructure should go in appropriate files:
# - compute.tf for VMs, Container Instances, Functions, etc.
# - vnet.tf for networking resources
# - etc.
#
# Example data sources:
# 
# data "azurerm_virtual_network" "existing" {
#   name                = "my-existing-vnet"
#   resource_group_name = "my-existing-rg"
# }
#
# data "azurerm_image" "ubuntu" {
#   name                = "my-custom-ubuntu-image"
#   resource_group_name = "my-images-rg"
# }
#
# data "azurerm_client_config" "current" {
#   # Gets current Azure client configuration (tenant_id, subscription_id, etc.)
# }
#
# data "azurerm_subscription" "current" {
#   # Gets current subscription information
# }
# =============================================================================

# Add your data sources below this line