variable "vpc_cidr_block" {}
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "ipv6_enabled" { type = bool }
variable "tags" { type = map(string) }
