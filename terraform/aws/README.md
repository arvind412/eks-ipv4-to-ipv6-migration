Terraform EKS Cluster Deployment
This repository contains a modular Terraform configuration to deploy an Amazon EKS (Elastic Kubernetes Service) cluster with support for IPv4/IPv6, scalable node groups, and reusable networking components.
Modules Overview
networking/
Creates VPC
Public and private subnets
Security groups for EKS control plane and worker nodes
Optional IPv6 support via enable_ipv6
cluster/
Provisions EKS control plane
Supports IPv4/IPv6 via cluster_ip_family ("ipv4" or "ipv6")
node_group/
Provisions managed node group with:
SSH access
Instance type selection
Autoscaling configuration
Root Module Inputs
Variable	Description
vpc_cidr_block	CIDR block for the VPC
public_subnet_cidrs	List of CIDRs for public subnets
private_subnet_cidrs	List of CIDRs for private subnets
enable_ipv6	Whether to enable IPv6 support
cluster_name	Name of the EKS cluster
node_group_name	Name of the node group
eks_cluster_role_name	IAM role name for EKS control plane
eks_node_role_name	IAM role name for EKS node group
node_instance_type	EC2 instance type (e.g. t3.medium)
ssh_key_name	SSH key for remote access
desired_capacity	Desired node count
min_size, max_size	Autoscaling min/max sizes
cluster_ip_family	IP family: ipv4 or ipv6
Getting Started
Update your terraform.tfvars or pass variables via CLI.
Initialize and apply Terraform:
cd terraform/aws
terraform init
terraform apply
