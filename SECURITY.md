# Security Policy

## Reporting Security Issues

**Do not create public issues for security vulnerabilities.** Instead, please report security issues to the maintainers privately.

### How to Report

1. Email: hachem.boudoukha@example.com
2. Include details about the vulnerability
3. Allow time for a fix before public disclosure

We appreciate responsible disclosure and will acknowledge your report within 48 hours.

## Security Best Practices for Users

### 1. AWS Credentials & Keys
- **Never commit AWS credentials** to the repository
- Use **IAM roles** instead of access keys when possible
- Store sensitive credentials in **AWS Secrets Manager**
- Use **AWS Systems Manager Parameter Store** for configuration

### 2. Docker Security
- Use **specific image versions**, not `latest`
- Scan images for vulnerabilities: `aws ecr scan-image`
- Run containers as **non-root users**
- Use **read-only root filesystem** when possible

### 3. Kubernetes Security
- Use **RBAC** (Role-Based Access Control)
- Implement **network policies** for pod communication
- Enable **pod security standards**
- Use **secrets** for sensitive data, not ConfigMaps
- Enable **audit logging** for cluster access

### 4. CI/CD Security
- Restrict **CodeBuild IAM permissions** to minimum required
- Use **GitHub secrets** for sensitive credentials
- Require **code reviews** before merge
- Implement **branch protection rules**
- Scan dependencies for vulnerabilities

### 5. Infrastructure (Terraform)
- Never store **state files** in version control
- Use **remote state** with encryption (S3 + DynamoDB)
- Enable **MFA** for production deployments
- Restrict **Terraform IAM permissions**
- Use **separate AWS accounts** for environments

## Security Hardening Checklist

- [ ] All container images run as non-root
- [ ] Security contexts defined in deployments
- [ ] Network policies restrict traffic
- [ ] RBAC properly configured
- [ ] Secrets encrypted at rest
- [ ] Audit logging enabled
- [ ] Resource limits defined
- [ ] Health checks configured
- [ ] Regular security scans performed
- [ ] Dependencies updated regularly

## Dependencies & Vulnerabilities

We regularly audit and update dependencies:

```bash
# Check for npm vulnerabilities
npm audit

# Update Node.js to latest LTS
npm install node@latest
```

## Container Image Scanning

AWS ECR automatically scans images:

```bash
# Trigger manual scan
aws ecr start-image-scan \
  --repository-name my-app-repo \
  --image-id imageTag=latest

# View scan results
aws ecr describe-image-scan-findings \
  --repository-name my-app-repo \
  --image-id imageTag=latest
```

## Compliance & Standards

This project aims to follow:
- **OWASP Top 10** security principles
- **CIS Kubernetes Benchmarks**
- **AWS Well-Architected Framework** security pillar
- **Container security best practices**

## Version Support

| Version | Support Status | Security Updates |
|---------|---|---|
| 1.0.0+ | Active | Yes |
| < 1.0.0 | Unsupported | No |

## Security Updates

We release security updates as soon as possible. Follow releases on GitHub.

---

**Your security matters. Thank you for helping keep this project safe!**
