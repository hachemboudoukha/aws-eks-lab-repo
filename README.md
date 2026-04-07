# AWS EKS CI/CD Pipeline with Terraform

Automated CI/CD pipeline deploying containerized applications to Amazon EKS using AWS CodePipeline, CodeBuild, CodeDeploy, and Terraform.

**Pipeline**: GitHub → CodePipeline → CodeBuild → ECR → EKS Cluster

## Quick Start

### Prerequisites
- AWS Account, GitHub, kubectl, Terraform, Docker

### Setup
```bash
git clone https://github.com/hachemboudoukha/aws-eks-lab-repo.git
cd aws-eks-lab-repo

# Set environment variables
export AWS_ACCOUNT_ID=<your-account-id>
export AWS_DEFAULT_REGION=us-east-1

# Deploy infrastructure
terraform init && terraform apply

# Build and test locally
docker build -t my-app .
docker run -p 8000:8000 my-app
```

## Project Structure
```
├── Dockerfile, buildspec.yml, appspec.yml   # Build & deploy config
├── deployment.yaml, service.yaml, ingress.yaml   # K8s manifests
├── web-app/                                 # Node.js application
└── scripts/                                 # Startup/stop scripts
```

## Key Features
- **Automated**: GitHub push → ECR → EKS deployment
- **Infrastructure as Code**: Terraform-provisioned AWS resources
- **Scalable**: K8s replicas with auto-scaling
- **Secure**: IAM roles, least-privilege access, health probes
- **Load Balanced**: AWS ALB with ingress

## Monitoring
```bash
kubectl get deployment my-app
kubectl get pods -l app=my-app
kubectl get svc my-app-service
kubectl logs -l app=my-app
```

## Configuration
Update in manifest files:
- `deployment.yaml`: ECR image URI
- `ingress.yaml`: Domain name
- `buildspec.yml`: AWS region and cluster name

## Author
**Hachem Boudoukha** | [LinkedIn](https://www.linkedin.com/in/hachemboudoukha/) | [GitHub](https://github.com/hachemboudoukha)
