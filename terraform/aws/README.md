# 🚀 Terraform EKS Cluster Deployment

This repository contains a **modular Terraform configuration** to deploy an **Amazon Elastic Kubernetes Service (EKS)** cluster with support for **IPv4/IPv6 networking**, **scalable node groups**, and **reusable networking components**.

---

## 🧩 Modules Overview

### **1. networking/**
Creates the foundational AWS networking layer for the EKS cluster:
- VPC with configurable CIDR block
- Public and private subnets
- Security groups for EKS control plane and worker nodes
- Optional **IPv6** support via `enable_ipv6`

### **2. cluster/**
Provisions the **EKS Control Plane**:
- Supports both IPv4 and IPv6 via `cluster_ip_family` (`"ipv4"` or `"ipv6"`)
- Configurable private/public API endpoints
- IAM role and security group integration

### **3. node_group/**
Creates **EKS Managed Node Groups**:
- Custom instance types (e.g., `t3.medium`)
- SSH key support for node access
- Autoscaling configuration (min/desired/max size)

---

## ⚙️ Root Module Inputs

| **Variable** | **Description** |
|---------------|-----------------|
| `vpc_cidr_block` | CIDR block for the VPC |
| `public_subnet_cidrs` | List of CIDRs for public subnets |
| `private_subnet_cidrs` | List of CIDRs for private subnets |
| `enable_ipv6` | Enable IPv6 support for networking |
| `cluster_name` | Name of the EKS cluster |
| `node_group_name` | Name of the node group |
| `eks_cluster_role_name` | IAM role name for the EKS control plane |
| `eks_node_role_name` | IAM role name for the EKS node group |
| `node_instance_type` | EC2 instance type (e.g., `t3.medium`) |
| `ssh_key_name` | SSH key name for remote node access |
| `desired_capacity` | Desired node count |
| `min_size`, `max_size` | Autoscaling min and max node counts |
| `cluster_ip_family` | IP family for the cluster (`ipv4` or `ipv6`) |

---

## 🪜 Getting Started

### **1️⃣ Prerequisites**
- Terraform v1.8.0 or later  
- AWS credentials configured (`~/.aws/credentials` or environment variables)  
- IAM permissions to manage EKS, EC2, IAM, and VPC resources  

---

### **2️⃣ Setup and Deployment**

Clone this repository:
```bash
git clone https://github.com/<your-org>/terraform-eks-cluster.git
cd terraform-eks-cluster


terraform init
terraform apply
