# =============================================================================
# TERRAFORM OUTPUTS
# =============================================================================
# This file contains ONLY Terraform output values (output blocks).
# 
# Output values are used to expose information about your infrastructure
# after Terraform applies the configuration. They make values available
# for use by other Terraform configurations, automation scripts, or
# for display to users.
#
# Use this file for:
# - Exposing resource IDs, names, or attributes for other configurations
# - Displaying important information after deployment (URLs, IPs, etc.)
# - Making values available for remote state data sources
# - Providing information needed by CI/CD pipelines or scripts
# - Returning computed values that aren't known until after creation
#
# DO NOT put other Terraform configuration in this file such as:
# - Resource definitions (use appropriate resource files)
# - Variable declarations (use variables.tf) 
# - Data sources (use data.tf)
# - Provider configurations (use providers.tf)
#
# Output Value Examples:
# 
# output "resource_group_name" {
#   description = "Name of the resource group"
#   value       = azurerm_resource_group.main.name
# }
#
# output "virtual_network_id" {
#   description = "ID of the virtual network"
#   value       = azurerm_virtual_network.main.id
# }
#
# output "vm_public_ip" {
#   description = "Public IP address of the virtual machine"
#   value       = azurerm_public_ip.main.ip_address
#   sensitive   = false
# }
#
# output "database_connection_string" {
#   description = "Database connection string"
#   value       = azurerm_sql_server.main.fully_qualified_domain_name
#   sensitive   = true  # Mark as sensitive to hide from logs
# }
# =============================================================================

# Add your output values below this line