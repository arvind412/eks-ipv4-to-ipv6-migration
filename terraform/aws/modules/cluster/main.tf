resource "aws_eks_addon" "vpc_cni" {
count = local.enable_vpc_cni ? 1 : 0
code
Code
cluster_name = aws_eks_cluster.this.name
addon_name   = "vpc-cni"
addon_version = null

resolve_conflicts_on_create = "OVERWRITE"
resolve_conflicts_on_update = "OVERWRITE"
tags                        = var.tags
}
resource "aws_eks_addon" "coredns" {
count = local.enable_coredns ? 1 : 0
code
Code
cluster_name = aws_eks_cluster.this.name
addon_name   = "coredns"
addon_version = null

resolve_conflicts_on_create = "OVERWRITE"
resolve_conflicts_on_update = "OVERWRITE"
tags                        = var.tags
}
