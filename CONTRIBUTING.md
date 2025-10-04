# Contributing to Terraform Template

Thank you for your interest in contributing to this Azure-focused Terraform template! 

## Code of Conduct

This project adheres to a code of conduct. By participating, you are expected to uphold this code.

## How to Contribute

### Reporting Issues

- Use the GitHub issue tracker to report bugs
- Describe the issue clearly with steps to reproduce
- Include relevant Terraform and Azure provider versions

### Suggesting Enhancements

- Open an issue with the label "enhancement"
- Describe the enhancement and its benefits
- Consider backward compatibility

### Pull Requests

1. **Fork** the repository
2. **Create a branch** from `main` for your changes
3. **Follow the established patterns**:
   - Use the existing file organization structure
   - Add comprehensive documentation headers
   - Include Azure-focused examples
   - Update relevant documentation
4. **Test your changes**:
   - Run `make fmt` to format code
   - Run `make validate ENV=dev` to validate syntax
   - Test with multiple environments if applicable
5. **Commit with clear messages**:
   - Use conventional commit format
   - Reference issues where applicable
6. **Submit the pull request**

### File Organization Guidelines

When adding new resources:
- Place them in the appropriate existing file OR
- Create a new dedicated file if you have 3+ related resources
- Always include comprehensive documentation headers
- Follow the established comment and example patterns

### Documentation Standards

- Use Azure services in examples
- Include practical, real-world examples
- Explain the "why" not just the "what"
- Maintain consistency with existing documentation style

## Development Setup

```bash
# Clone your fork
git clone https://github.com/PseudoCoding/terraform-template.git
cd terraform-template

# Install prerequisites
# - Terraform >= 1.5
# - Azure CLI
# - Make

# Test the setup
make help
make validate ENV=dev
```

## Questions?

Open an issue with the "question" label, and we'll help you out!