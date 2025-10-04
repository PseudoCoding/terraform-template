# =============================================================================
# COMPUTE RESOURCES
# =============================================================================
# This file contains ONLY compute-related Terraform resources.
# 
# This includes all compute infrastructure components such as virtual machines,
# container instances, functions, and compute-related security settings.
# Keep all compute resources centralized here for better organization.
#
# Use this file for:
# - Virtual machines and VM scale sets
# - Container instances and container groups
# - Azure Functions and App Services
# - Kubernetes clusters (AKS)
# - Batch accounts and compute pools
# - VM extensions and custom script extensions
# - Availability sets and zones
# - Load balancers for compute resources
# - Auto-scaling configurations
#
# DO NOT put non-compute resources in this file such as:
# - Storage accounts (use storage.tf)
# - Networking resources (use networking.tf)
# - Databases (use database.tf)
# - Data sources (use data.tf)
# - Variables or outputs (use variables.tf/outputs.tf)
#
# Compute Resource Examples:
# 
# resource "azurerm_linux_virtual_machine" "main" {
#   name                = "vm-${var.project_name}-${var.environment}"
#   resource_group_name = azurerm_resource_group.main.name
#   location            = var.location
#   size                = "Standard_B1s"
#   admin_username      = "adminuser"
#   
#   disable_password_authentication = true
#   
#   network_interface_ids = [
#     azurerm_network_interface.main.id,
#   ]
#   
#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }
#   
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
#   
#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
#   
#   tags = var.common_tags
# }
#
# resource "azurerm_container_group" "main" {
#   name                = "ci-${var.project_name}-${var.environment}"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.main.name
#   ip_address_type     = "Public"
#   dns_name_label      = "${var.project_name}-${var.environment}"
#   os_type             = "Linux"
#   
#   container {
#     name   = "app"
#     image  = "nginx:latest"
#     cpu    = "0.5"
#     memory = "1.5"
#     
#     ports {
#       port     = 80
#       protocol = "TCP"
#     }
#   }
#   
#   tags = var.common_tags
# }
# =============================================================================

# Add your compute resources below this line