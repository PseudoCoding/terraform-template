# =============================================================================
# DATABASE RESOURCES
# =============================================================================
# This file contains ONLY database-related Terraform resources.
# 
# This includes all database infrastructure components such as SQL servers,
# databases, NoSQL databases, caching solutions, and database security settings.
# Keep all database resources centralized here for better organization.
#
# Use this file for:
# - SQL Server and SQL Database instances
# - MySQL and PostgreSQL databases
# - Cosmos DB and NoSQL databases
# - Redis Cache and other caching solutions
# - Database firewall rules and security settings
# - Database backup and recovery configurations
# - Database elastic pools and scaling settings
# - Database monitoring and auditing
# - Database connection strings and authentication
#
# DO NOT put non-database resources in this file such as:
# - Virtual machines (use compute.tf)
# - Storage accounts (use storage.tf)
# - Networking resources (use networking.tf)
# - Data sources (use data.tf)
# - Variables or outputs (use variables.tf/outputs.tf)
#
# Database Resource Examples:
# 
# resource "azurerm_mssql_server" "main" {
#   name                         = "sql-${var.project_name}-${var.environment}"
#   resource_group_name          = azurerm_resource_group.main.name
#   location                     = var.location
#   version                      = "12.0"
#   administrator_login          = var.sql_admin_username
#   administrator_login_password = var.sql_admin_password
#   
#   tags = var.common_tags
# }
#
# resource "azurerm_mssql_database" "main" {
#   name         = "db-${var.project_name}-${var.environment}"
#   server_id    = azurerm_mssql_server.main.id
#   collation    = "SQL_Latin1_General_CP1_CI_AS"
#   license_type = "LicenseIncluded"
#   sku_name     = "Basic"
#   
#   tags = var.common_tags
# }
#
# resource "azurerm_cosmosdb_account" "main" {
#   name                = "cosmos-${var.project_name}-${var.environment}"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.main.name
#   offer_type          = "Standard"
#   kind                = "GlobalDocumentDB"
#   
#   consistency_policy {
#     consistency_level = "BoundedStaleness"
#   }
#   
#   geo_location {
#     location          = var.location
#     failover_priority = 0
#   }
#   
#   tags = var.common_tags
# }
# =============================================================================

# Add your database resources below this line