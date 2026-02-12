

# **AWS Modular VPC + EC2 Infrastructure (Terraform)**

This project builds a modular AWS environment using Terraform. It deploys a VPC, a public subnet, an Internet Gateway, a route table, a security group, and an EC2 instance. The design focuses on clean Infrastructure‑as‑Code, reusable modules, and a clear understanding of core AWS networking.

## **Architecture Overview**

The environment is a simple public‑only setup suitable for testing and learning. It includes:

- VPC  
- Public Subnet  
- Internet Gateway  
- Public Route Table  
- Security Group (SSH and HTTP)  
- EC2 Instance with a public IP  

The instance runs in the public subnet and is reachable directly from the internet.

### **Architecture Diagram**

Internet  
  │  
Internet Gateway  
  │  
Public Subnet  
  │  
EC2 Instance (public IP)

## **Modular Structure**

/modules  
  /vpc  
  /subnets  
  /security-groups  
  /ec2  

main.tf  
variables.tf  
outputs.tf  

Each module handles a specific part of the infrastructure, keeping the code organised, reusable, and easy to extend.

## **Future Enhancements**

This project forms the base for more advanced AWS setups, including private subnets, a NAT Gateway, an Application Load Balancer, an Auto Scaling Group with a Launch Template, and CloudWatch monitoring.

