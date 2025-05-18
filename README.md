# Project
# Terraform AWS Infrastructure Deployment

This project demonstrates how to use Terraform to provision basic AWS infrastructure using the default VPC. The objective is to deploy a web server (Apache/Nginx) on an EC2 instance, with all configurations done via Infrastructure as Code (IaC).

---

## 🔧 Technologies Used

- Terraform 
- AWS (Free Tier)
- EC2
- Default VPC
- Security Groups
- User Data for Web Server Installation

---

## Infrastructure Components

The infrastructure was created using the default VPC to avoid complexity while still showcasing Terraform capabilities.

### 1. Provider Configuration

- AWS provider configured with default region (e.g., us-east-1)
- aws ec2 create-default-vpc --region <your_region>
- To verify the vpc was created
- aws ec2 describe-vpcs --filters "Name=isDefault,Values=true" --region <your-region>

### 2. EC2 Instance

- AMI: Amazon Linux 2 (free tier eligible)
- Instance Type: t2.micro
- Deployed inside the default subnet of the default VPC

### 3. Security Group

- Allows inbound traffic on:
  - Port 22 (SSH)
  - Port 80 (HTTP)
- Allows all outbound traffic
- Associated with the EC2 instance

### 4. User Data

- Automated installation of a web server (Apache/Nginx)
- Custom index.html to verify web server deployment

### 5. Outputs

- Public IP of the EC2 instance
- Web URL for quick access

## 📦 How to Deploy

```bash
# 1. Initialize Terraform
terraform init

# 2. Review execution plan
terraform plan

# 3. Apply the configuration
terraform apply
# 4. To teardown all the created resources
terraform destroy
