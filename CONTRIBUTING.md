# Contributing to AWS EKS CI/CD Pipeline

Thank you for your interest in contributing! This guide will help you get started.

## Code of Conduct

Be respectful, inclusive, and professional in all interactions.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/aws-eks-lab-repo.git
   cd aws-eks-lab-repo
   ```
3. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Development Workflow

### Local Testing

```bash
# Build Docker image locally
docker build -t my-app .

# Run and test
docker run -p 8000:8000 my-app

# Access the app
curl http://localhost:8000
```

### Kubernetes Testing

```bash
# Apply manifests to local cluster (kind, minikube, or EKS)
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Verify deployment
kubectl get pods
kubectl logs -l app=my-app
```

## Making Changes

### Manifest Changes
- Update YAML files with appropriate comments
- Test changes with `kubectl --dry-run=client apply`
- Ensure all resources have proper labels and annotations

### Docker Changes
- Keep images minimal and secure
- Use specific base image versions (not `latest`)
- Remove unnecessary dependencies
- Run as non-root user

### Script Changes
- Add error handling (`set -e` in bash scripts)
- Use meaningful variable names
- Include comments for complex logic
- Avoid hardcoded paths or credentials

## Commit Guidelines

Write clear, descriptive commit messages:

```
feat: Add support for Kubernetes secrets management

- Integrate AWS Secrets Manager
- Update buildspec.yml to fetch secrets
- Add documentation for configuration

Closes #123
```

## Pull Request Process

1. **Update documentation** if needed
2. **Test your changes** thoroughly
3. **Create a descriptive PR** with:
   - Clear title and description
   - Link to related issues
   - List of changes made
4. **Address review feedback** promptly
5. **Ensure CI/CD passes** before merge

## Issues & Bug Reports

When reporting issues, include:
- Steps to reproduce
- Expected behavior
- Actual behavior
- Relevant logs or screenshots
- Your environment (OS, kubectl version, etc.)

## Feature Requests

Suggest improvements by:
- Creating a GitHub Issue
- Describing the use case
- Explaining the expected benefit
- Providing examples if applicable

## Documentation

- Keep README.md up-to-date
- Add comments to complex code
- Document environment variables in `.env.example`
- Update this CONTRIBUTING guide if needed

## Questions?

Open an issue or start a discussion on GitHub.

---

**Thank you for contributing!** 🎉
