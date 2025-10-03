resource "aws_iam_role" "velero_role" {
  name    = ${var.cluster_name}-velero-irsa-${random_string.prefix.result}"

  
assume_role_policy = jsonencode({
Version = "2012-10-17"
Statement = [
{
Effect = "Allow"
Principal = {
Federated = data.aws_iam_openid_connect_provider.oidc.arn
}
Action = "sts:AssumeRoleWithWebIdentity"
Condition = {
StringEquals = {
"${replace(data.aws_eks_cluster.main.identity[0].oidc[0].issuer, "https://", "")}:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
}
}
}
]
})
}
resource "aws_iam_policy" "velero_policy" {
name        = "AmazonEKSVeleroPolicy"
path        = "/"
description = "Policy for Velero"
policy = file("${path.module}/policies/velero-iam-policy.json")
}
resource "aws_iam_role_policy_attachment" "velero_role_attach" {
role       = aws_iam_role.velero_role.name
policy_arn = aws_iam_policy.velero_policy.arn
}
resource "kubernetes_service_account" "velero_sa" {
metadata {
name      = "velero"
namespace = "kube-system"
annotations = {
"eks.amazonaws.com/role-arn" = aws_iam_role.velero_role.arn
}
}
}
resource "helm_release" "velero" {
name             = "velero"
namespace        = "kube-system"
create_namespace = false
repository       = "https://vmware-tanzu.github.io/helm-charts"
chart            = "velero"
version          = "10.1.0"
depends_on       = [ aws_s3_bucket.velero_backup, aws_s3_bucket_public_access_block.velero_backup ]
values = [
yamlencode(merge({
configuration = {
backupStorageLocation = [
{
name    = "default"
provider = "aws"
bucket   = aws_s3_bucket.velero_backup.bucket
config = {
region = var.region
}
}
]
volumeSnapshotLocation = [
{
name    = "default"
provider = "aws"
config = {
region = var.region
}
}
]
features = "EnableCSI"
}
credentials = {
useSecret = false
}
initContainers = [
{
name         = "velero-plugin-for-aws"
image        = "velero/velero-plugin-for-aws:v1.8.2"
volumeMounts = [
{
mountPath = "/target"
name      = "plugins"
}
]
}
]
serviceAccount = {
server = {
create     = false
name       = "velero"
annotations = {
"eks.amazonaws.com/role-arn" = aws_iam_role.velero_role.arn
}
}
}
nodeSelector = {
"eks.amazonaws.com/nodegroup" = var.nodegroup_name
}
deployNodeAgent = false
useVolumeSnapshots = true
}))
]
}
