locals {
  today = regex("^([0-9]{4}-[0-9]{2}-[0-9]{2})", timestamp())[0]

  common_tags = {
    BU                                  = "Cloud Infrastructure"
    Client                              = "Visionet"
    Company                             = "Visionet"
    CreationDate                        = local.today
    DeleteOn                            = local.today
    Dept                                = "CIS"
    Environment                         = "Dev"
    Owner                               = "eks-cluster-migration-poc"
    Project                             = "EKS-Migration"
    Schedule                            = "working hours"
    "alpha.eksctl.io/cluster-oidc-enabled" = "true"
  }
}
