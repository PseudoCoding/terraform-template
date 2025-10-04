# =============================================================================
# NETWORKING RESOURCES
# =============================================================================
# This file contains ONLY networking-related Terraform resources.
# 
# This includes all network infrastructure components such as virtual networks,
# subnets, security groups, DNS zones, load balancers, and network interfaces.
# Keep all networking resources centralized here for better organization.
#
# Use this file for:
# - Virtual Networks (VNets) and subnets
# - Network Security Groups (NSGs) and security rules
# - DNS zones and DNS records
# - Load balancers and application gateways
# - Network interfaces and public IP addresses
# - VNet peering connections
# - Route tables and user-defined routes
# - NAT gateways and VPN gateways
# - Network watchers and flow logs
#
# DO NOT put non-networking resources in this file such as:
# - Virtual machines (use compute.tf)
# - Storage accounts (use storage.tf)
# - Databases (use database.tf)
# - Data sources (use data.tf)
# - Variables or outputs (use variables.tf/outputs.tf)
#
# Networking Resource Examples:
# 
# resource "azurerm_virtual_network" "main" {
#   name                = "vnet-${var.environment}"
#   address_space       = ["10.0.0.0/16"]
#   location            = var.location
#   resource_group_name = azurerm_resource_group.main.name
# }
#
# resource "azurerm_subnet" "internal" {
#   name                 = "subnet-internal"
#   resource_group_name  = azurerm_resource_group.main.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = ["10.0.2.0/24"]
# }
#
# resource "azurerm_network_security_group" "main" {
#   name                = "nsg-${var.environment}"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.main.name
# }
#
# resource "azurerm_public_ip" "main" {
#   name                = "pip-${var.environment}"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.main.name
#   allocation_method   = "Static"
# }
# =============================================================================

# Add your networking resources below this line