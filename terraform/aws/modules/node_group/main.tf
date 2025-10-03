data "aws_iam_role" "eks_node_role" {
name = var.node_role_name
}
resource "aws_eks_node_group" "this" {
cluster_name    = var.cluster_name
node_group_name = var.node_group_name
node_role_arn   = data.aws_iam_role.eks_node_role.arn
subnet_ids      = var.private_subnet_ids
instance_types  = [var.node_instance_type]
disk_size       = 20
ami_type        = "AL2023_x86_64_STANDARD"
version         = "1.33"
remote_access {
ec2_ssh_key               = var.ssh_key_name
source_security_group_ids = [var.node_sg_id]
}
scaling_config {
desired_size = var.desired_capacity
min_size     = var.min_size
max_size     = var.max_size
}
update_config {
max_unavailable = 1
}
lifecycle {
ignore_changes = [remote_access]
}
tags = var.tags
}
