variable "cluster_name" { type = string }
variable "nodegroup_name" { type = string }
variable "region" { type = string }
variable "vpc_id" { type = string }
variable "public_subnet_ids" {
type = list(string)
default = []
}
variable "private_subnet_ids" {
type = list(string)
default = []
}
variable "ipv6_enabled" {
type        = bool
default     = false
}
variable "tags" { type = map(string) }
