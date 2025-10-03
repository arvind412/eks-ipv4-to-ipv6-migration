variable "vpc_id" {}
variable "cluster_name" {}
variable "cluster_role_name" {}
variable "cluster_ip_family" {}
variable "cluster_sg_id" {}
variable "cluster_admin_iam_roles" { type = list(string)}
variable "cluster_endpoint_private" { type = bool }
variable "cluster_endpoint_public" { type = bool }
variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }
variable "tags" { type = map(string) }
