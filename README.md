# AWS EKS CI/CD Pipeline with Terraform

A complete, production-ready CI/CD pipeline that automates building, testing, and deploying containerized applications to Amazon EKS (Elastic Kubernetes Service).

## 🏗️ Architecture Overview

```
Developers → GitHub → CodePipeline → CodeBuild → ECR → EKS Deployment
```

### Components:
- **Source**: GitHub repository triggers webhook
- **Build**: AWS CodeBuild compiles code and builds Docker image
- **Registry**: Amazon ECR stores Docker images
- **Deployment**: AWS CodeDeploy pushes to EKS cluster
- **Orchestration**: Kubernetes manifests manage replicas, scaling, ingress
- **Infrastructure**: Terraform provisions AWS resources

## ✨ Key Features

- ✅ **Fully Automated** - From code push to production deployment
- ✅ **Reproducible** - Infrastructure as Code with Terraform
- ✅ **Scalable** - Auto-scaling with Kubernetes replicas
- ✅ **Secure** - IAM roles with least-privilege access
- ✅ **Observable** - Health checks and deployment monitoring
- ✅ **Load Balanced** - AWS Application Load Balancer (ALB)

## 📋 Prerequisites

- AWS Account with appropriate IAM permissions
- GitHub repository configured
- kubectl installed
- Terraform CLI installed
- Docker installed (for local testing)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/hachemboudoukha/aws-eks-lab-repo.git
cd aws-eks-lab-repo
```

### 2. Set Environment Variables

Create a `.env` file in the root directory:

```bash
export AWS_ACCOUNT_ID=<your-account-id>
export AWS_DEFAULT_REGION=us-east-1
export IMAGE_REPO_NAME=my-app-repo
export EKS_CLUSTER_NAME=my-eks-cluster
export DOCKER_REGISTRY_URI=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com
```

### 3. Build & Test Locally

```bash
# Build Docker image
docker build -t my-app .

# Run container locally
docker run -p 8000:8000 my-app
```

Visit `http://localhost:8000` to verify.

### 4. Set Up Infrastructure with Terraform

```bash
terraform init
terraform plan
terraform apply
```

### 5. Configure CodePipeline

1. Create AWS CodePipeline with:
   - **Source**: GitHub (webhook trigger)
   - **Build**: CodeBuild (uses `buildspec.yml`)
   - **Deploy**: CodeDeploy (uses `appspec.yml`)

2. Update `buildspec.yml` with your AWS account details

### 6. Deploy to EKS

The pipeline will automatically:
- Build Docker image
- Push to ECR
- Apply Kubernetes manifests
- Scale to 5 replicas

## 📁 Project Structure

```
.
├── Dockerfile                 # Container image definition
├── buildspec.yml             # AWS CodeBuild configuration
├── appspec.yml               # AWS CodeDeploy configuration
├── deployment.yaml           # Kubernetes Deployment
├── service.yaml              # Kubernetes Service (LoadBalancer)
├── ingress.yaml              # Kubernetes Ingress (ALB)
├── replicaset.yaml           # Kubernetes ReplicaSet
├── configmap.yaml            # Kubernetes ConfigMap
├── web-app/
│   ├── index.js             # Node.js application
│   ├── index.html           # HTML content
│   └── package.json         # Node.js dependencies
└── scripts/
    ├── app_start.sh         # Application startup script
    └── app_stop.sh          # Application stop script
```

## 🔧 Configuration

### Customize for Your Environment

Replace these values in the manifest files:

| File | Variable | Example |
|------|----------|---------|
| `deployment.yaml` | Docker image URI | `123456789.dkr.ecr.us-east-1.amazonaws.com/my-app:latest` |
| `ingress.yaml` | Domain name | `myapp.example.com` |
| `buildspec.yml` | AWS region | `us-east-1` |
| `buildspec.yml` | EKS cluster name | `my-eks-cluster` |

## 📊 Monitoring

### View Application Status

```bash
# Get deployment info
kubectl get deployment my-app

# View pods
kubectl get pods -l app=my-app

# Check service endpoint
kubectl get svc my-app-service

# View ingress
kubectl get ingress my-app-ingress

# Describe deployment
kubectl describe deployment my-app

# View logs
kubectl logs -l app=my-app
```

## 🔐 Security Best Practices

- ✅ Uses IAM roles instead of AWS keys
- ✅ Least-privilege access policies
- ✅ Private subnet deployment
- ✅ Resource limits and requests
- ✅ Health checks (liveness & readiness probes)
- ✅ Non-root container user recommended

## 🧪 Testing

### Local Testing

```bash
docker build -t my-app .
docker run -p 8000:8000 my-app
curl http://localhost:8000
```

### Kubernetes Testing

```bash
# Port forward to local machine
kubectl port-forward svc/my-app-service 8000:80

# Test endpoint
curl http://localhost:8000
```

## 📚 Learning Resources

This project covers:
- AWS DevOps services (CodePipeline, CodeBuild, CodeDeploy)
- Kubernetes orchestration and deployments
- Docker containerization
- IAM security and access management
- CI/CD pipeline design
- Infrastructure as Code (Terraform)
- Application Load Balancing

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit changes (`git commit -am 'Add improvement'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Submit a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Hachem Boudoukha**
- LinkedIn: [linkedin.com/in/hachemboudoukha](https://www.linkedin.com/in/hachemboudoukha/)
- GitHub: [@hachemboudoukha](https://github.com/hachemboudoukha)

## 🆘 Troubleshooting

### Issue: CodeBuild fails with "permission denied"

**Solution**: Ensure the CodeBuild IAM role has permissions to:
- Access ECR
- Manage EKS cluster
- Create/update security groups

### Issue: Pods not starting

**Solution**: Check pod logs:
```bash
kubectl logs <pod-name>
kubectl describe pod <pod-name>
```

### Issue: LoadBalancer not getting external IP

**Solution**: Wait 2-3 minutes and check:
```bash
kubectl get svc my-app-service -w
```

## 🎯 Next Steps

1. **Add automated tests** to the pipeline
2. **Implement monitoring** with Prometheus/Grafana
3. **Set up logging** with CloudWatch/ELK
4. **Add security scanning** in the build stage
5. **Implement blue-green deployments**
