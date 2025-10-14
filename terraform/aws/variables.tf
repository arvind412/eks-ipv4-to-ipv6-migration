variable "vpc_id" {
  type        = string
  description = "Existing VPC ID"
  default     = ""
}

variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}

variable "public_subnet_ids" {
    type = list(string)
    default = []
}

variable "private_subnet_ids" {
    type = list(string)
    default = []
}

variable "ipv6_enabled" { 
    type = bool 
    default = true
}

variable "region" {
  type        = string
  description = "AWS region."
}

variable "cluster_name" {
    type = string
    default = "eks-test"
}

variable "cluster_sg_id" {
    type = string
}

variable "cluster_role_name" {
    type = string
}

variable "cluster_admin_iam_roles" {
  type        = list(string)
  description = "List of IAM role ARNs to be granted admin access to EKS"
}

variable "cluster_endpoint_private" { 
    type = bool
}

variable "cluster_endpoint_public" { 
    type = bool 
}

variable "node_role_name" {
    type = string
}

variable "node_instance_type" {
    type = string
    default = "t3.medium"
}

variable "node_group_name" {
    type = string
    default = "system"
}

variable "node_sg_id" {
    type = string
}

variable "node_ssh_key_name" {
    type = string
    default = "new-ipv6"
}

variable "node_group_desired_size" {
    type = number
    default = 1
}

variable "node_group_min_size" {
    type = number
    default = 1
}

variable "node_group_max_size" {
    type = number
    default = 2
}
