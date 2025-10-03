variable "vpc_id" {}
variable "cluster_name" {}
variable "node_group_name" {}
variable "node_role_name" {}
variable "node_sg_id" {}
variable "private_subnet_ids" { type = list(string) }
variable "node_instance_type" {}
variable "ssh_key_name" {}
variable "desired_capacity" {}
variable "min_size" {}
variable "max_size" {}
variable "tags" { type = map(string) }
