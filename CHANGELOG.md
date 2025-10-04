# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- N/A

### Changed
- N/A

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A

## [1.0.3] - 2025-10-04

### Added
- **Automated Release Workflow**: New GitHub Actions workflow for automatic releases
  - Automatically detects new versions from CHANGELOG.md updates
  - Creates git tags and GitHub releases when changelog is updated
  - Extracts release notes from changelog content
  - Prevents duplicate releases with tag existence checking
  - Triggers only on main branch when CHANGELOG.md is modified

## [1.0.2] - 2025-10-04

### Fixed
- **GitHub Actions Workflow**: Fixed SARIF upload step in terraform.yml
  - Added conditional logic to only upload SARIF results for public repositories
  - Added documentation explaining GitHub Advanced Security requirements
  - Prevents workflow failures on private repositories without Advanced Security

## [1.0.1] - 2025-10-04

### Changed
- **Environment Configuration Files**: Improved formatting consistency
  - Standardized spacing in subnet configuration maps across all environment files
  - Consistent comment formatting and alignment for better readability
  - Applied consistent spacing to variable assignments in dev, stage, test, and prod configurations

## [1.0.0] - 2025-10-04

### Added
- **File Structure**: Well-organized Terraform files with single responsibility principle
  - `backend.tf` - Backend configuration only
  - `providers.tf` - Provider configurations and version constraints
  - `variables.tf` - Input variable declarations
  - `outputs.tf` - Output value definitions
  - `data.tf` - Data source references (existing resources)
  - `main.tf` - Miscellaneous resources without dedicated files
  - `compute.tf` - Compute resources (VMs, containers, functions)
  - `networking.tf` - Network resources (VNets, NSGs, load balancers)
  - `storage.tf` - Storage resources (storage accounts, containers)
  - `database.tf` - Database resources (SQL, CosmosDB, caches)

- **Environment Management**: Multi-environment support via config directory
  - Development, staging, test, and production configurations
  - Environment-specific variable files with realistic examples
  - Clear separation of environment-specific values

- **Automation**: Comprehensive Makefile for Terraform operations
  - Environment validation and error handling
  - Color-coded output for better user experience
  - Safety confirmations for destructive operations
  - Support for advanced operations (import, graph, security scanning)

- **Documentation**: Extensive documentation throughout
  - Clear file purpose statements and usage guidelines
  - Azure-focused examples and best practices
  - Comprehensive README with quick start guide
  - Security policy and contributing guidelines

- **Azure Focus**: Optimized for Microsoft Azure
  - Azure Resource Manager provider examples
  - Azure-specific resource naming conventions
  - Azure CLI integration for authentication
  - Common Azure service patterns and configurations

- **Developer Experience**: Professional repository setup
  - GitHub issue and pull request templates
  - Security policy with best practices
  - Contributing guidelines for team collaboration
  - Proper .gitignore configuration for Terraform projects

### Technical Details
- **Terraform Version**: >= 1.5 required
- **Azure Provider**: ~> 3.0 recommended
- **File Organization**: Single responsibility principle with clear separation
- **Environment Support**: dev, staging, test, production out of the box
- **Security**: Built-in patterns for secrets management and secure deployments

---

## How to Update This Changelog

When making changes to the repository:

1. **Add entries** under the `[Unreleased]` section
2. **Use categories**: Added, Changed, Deprecated, Removed, Fixed, Security
3. **Be specific**: Include what was changed and why
4. **Link issues**: Reference GitHub issues where applicable
5. **Move to versioned section** when releasing

### Example Entry Format:
```markdown
### Added
- New storage.tf examples for Azure Blob Storage with lifecycle policies [#123]
- Support for multiple Azure regions in networking configuration

### Changed
- Updated Azure provider version constraint to ~> 3.80 for latest features
- Improved error handling in Makefile for better user experience [#456]

### Fixed
- Resolved issue with NSG rules not applying correctly in staging environment [#789]
```