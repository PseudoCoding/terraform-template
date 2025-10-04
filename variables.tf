# =============================================================================
# TERRAFORM VARIABLES
# =============================================================================
# This file contains ONLY Terraform variable declarations (variable blocks).
# 
# Variables are input parameters that make your Terraform configuration flexible
# and reusable across different environments. They allow you to customize
# deployments without modifying the actual resource configurations.
#
# Use this file for:
# - Environment-specific values (dev, staging, prod)
# - Resource naming and sizing parameters
# - Location and region settings
# - Feature flags and configuration toggles
# - Sensitive values (passwords, keys) - mark as sensitive
# - Common tags and metadata
# - Network CIDR blocks and IP ranges
# - Instance types and SKU specifications
#
# DO NOT put other Terraform configuration in this file such as:
# - Resource definitions (use appropriate resource files)
# - Data sources (use data.tf)
# - Output values (use outputs.tf)
# - Provider configurations (use providers.tf)
#
# Variable Declaration Examples:
# 
# variable "environment" {
#   description = "Environment name (dev, staging, prod)"
#   type        = string
#   default     = "dev"
#   
#   validation {
#     condition     = contains(["dev", "staging", "prod"], var.environment)
#     error_message = "Environment must be dev, staging, or prod."
#   }
# }
#
# variable "location" {
#   description = "Azure region for resource deployment"
#   type        = string
#   default     = "East US"
# }
#
# variable "project_name" {
#   description = "Name of the project for resource naming"
#   type        = string
#   
#   validation {
#     condition     = length(var.project_name) <= 10 && can(regex("^[a-z0-9]+$", var.project_name))
#     error_message = "Project name must be 10 characters or less and contain only lowercase letters and numbers."
#   }
# }
#
# variable "common_tags" {
#   description = "Common tags to apply to all resources"
#   type        = map(string)
#   default = {
#     Environment = "dev"
#     ManagedBy   = "Terraform"
#   }
# }
#
# variable "sql_admin_password" {
#   description = "Password for SQL Server administrator"
#   type        = string
#   sensitive   = true
# }
# =============================================================================

# Add your variable declarations below this line