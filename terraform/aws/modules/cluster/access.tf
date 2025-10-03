resource "aws_eks_access_entry" "admins" {
for_each      = toset(var.cluster_admin_iam_roles)
cluster_name  = aws_eks_cluster.this.name
principal_arn = each.value
type          = "STANDARD"
}
resource "aws_eks_access_policy_association" "admin_policy" {
for_each      = toset(var.cluster_admin_iam_roles)
cluster_name  = aws_eks_cluster.this.name
principal_arn = each.value
policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
access_scope {
type = "cluster"
}
}
