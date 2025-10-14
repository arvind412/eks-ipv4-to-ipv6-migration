# module "aws_vpc" {
#     source                  = "./modules/networking"
#     vpc_cidr_block          = var.vpc_cidr_block
#     public_subnet_cidrs     = var.public_subnet_cidrs
#     private_subnet_cidrs    = var.private_subnet_cidrs
#     ipv6_enabled            = var.ipv6_enabled
#     tags                    = local.common_tags
# }

module "eks_cluster" {
  source                    = "./modules/cluster"
  vpc_id                    = var.vpc_id
  cluster_name              = var.cluster_name
  cluster_ip_family         = var.ipv6_enabled ? "ipv6": "ipv4"
  cluster_sg_id             = var.cluster_sg_id
  cluster_role_name         = var.cluster_role_name
  cluster_admin_iam_roles   = var.cluster_admin_iam_roles
  cluster_endpoint_private  = var.cluster_endpoint_private
  cluster_endpoint_public   = var.cluster_endpoint_public
  public_subnet_ids         = var.public_subnet_ids
  private_subnet_ids        = var.private_subnet_ids
  tags                      = local.common_tags
}

module "eks_node_group" {
  source                    = "./modules/node_group"
  vpc_id                    = var.vpc_id
  cluster_name              = module.eks_cluster.cluster_name
  private_subnet_ids        = var.private_subnet_ids
  node_group_name           = var.node_group_name
  node_sg_id                = var.node_sg_id
  node_instance_type        = var.node_instance_type
  node_role_name            = var.node_role_name
  desired_capacity          = var.node_group_desired_size
  min_size                  = var.node_group_min_size
  max_size                  = var.node_group_max_size
  ssh_key_name              = var.node_ssh_key_name
  tags                      = local.common_tags
}

module "eks_core_services" {
  source                    = "./modules/services"
  cluster_name              = module.eks_cluster.cluster_name
  nodegroup_name            = module.eks_node_group.name
  region                    = var.region
  vpc_id                    = var.vpc_id
  public_subnet_ids         = var.private_subnet_ids
  private_subnet_ids        = var.private_subnet_ids
  ipv6_enabled              = var.ipv6_enabled
  tags                      = local.common_tags
}
