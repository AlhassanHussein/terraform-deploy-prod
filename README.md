

# terraform-deploy-prod

A professional Terraform module for production-grade infrastructure deployment.

## 📋 Prerequisites
- [Terraform CLI](https://developer.hashicorp.com) (1.0+)
- Configured Cloud Credentials (e.g., AWS, Azure, or GCP)
- An existing SSH Key for instance access

## 📂 Project Structure
```text
.   modules/vpc|ec2|sg
├── main.tf            # Core resource logic
├── variables.tf       # Input definitions
├── outputs.tf         # Post-deployment data
├── providers.tf       # Provider & Backend config
└── terraform.tfvars   # Production secrets (do not commit)


terraform init
terraform plan
terraform apply
terraform apply -target=module.ec2 (remmeber to chnage number of ec2)
terraform apply -auto-approve

terrafrom destroy
terraform destroy -auto-approve
