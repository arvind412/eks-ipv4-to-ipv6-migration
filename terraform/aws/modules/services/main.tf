data "aws_eks_cluster" "main" {
name = var.cluster_name
}
data "aws_eks_cluster_auth" "main" {
name = var.cluster_name
}
data "aws_iam_openid_connect_provider" "oidc" {
url = data.aws_eks_cluster.main.identity[0].oidc[0].issuer
}
resource "random_string" "prefix" {
length  = 6
upper   = false
special = false
}
