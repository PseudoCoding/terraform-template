# Security Policy

## Supported Versions

This Terraform template is supported for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| Latest  | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

If you discover a security vulnerability in this Terraform template, please follow these steps:

### For Security Issues

**DO NOT** open a public GitHub issue for security vulnerabilities.

Instead:

1. **Email**: Send details to the repository maintainers privately
2. **Include**: 
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### For General Issues

For non-security related issues:
- Use the GitHub issue tracker
- Include relevant details about the Terraform configuration
- Specify which Azure services are affected

## Security Best Practices

When using this template:

### State File Security
- **Never commit** `.tfstate` files to version control
- Use **remote state** with proper access controls
- Enable **state file encryption** in your backend

### Secrets Management
- **Never hardcode** passwords, keys, or secrets in `.tf` files
- Use **Azure Key Vault** for sensitive data
- Set sensitive variables via **environment variables** or **secure CI/CD**
- Mark sensitive variables with `sensitive = true`

### Access Control
- Implement **least privilege** Azure RBAC policies
- Use **managed identities** when possible
- Regularly review and rotate **service principal credentials**

### Network Security
- Follow **Azure networking best practices**
- Implement proper **NSG rules** and **firewall configurations**
- Use **private endpoints** for Azure services when applicable

### Example Secure Patterns

```bash
# Set sensitive variables via environment
export TF_VAR_sql_admin_password="your-secure-password"

# Use Azure CLI authentication (recommended)
az login

# Or use service principal with environment variables
export ARM_CLIENT_ID="your-client-id"
export ARM_CLIENT_SECRET="your-client-secret"
export ARM_SUBSCRIPTION_ID="your-subscription-id"
export ARM_TENANT_ID="your-tenant-id"
```

## Updates

Security updates and patches will be communicated through:
- GitHub releases
- Repository README updates
- Issue notifications for critical vulnerabilities