# module "frontend" {
#   depends_on = [module.backend]
#   source     = "git::https://github.com/raghudevopsb79/tf-module-app.git"
#
#   instance_type      = var.components["frontend"]["instance_type"]
#   name               = var.components["frontend"]["name"]
#   env                = var.env
#   port_no            = var.components["frontend"]["port_no"]
#   disk_size          = var.components["frontend"]["disk_size"]
#   vault_token        = var.vault_token
#   SSH_PASSWORD       = var.SSH_PASSWORD
#   prometheus_servers = var.prometheus_servers
#   zone_id            = data.aws_route53_zone.main.zone_id
# }
#
# module "backend" {
#   depends_on = [module.mysql]
#   source     = "git::https://github.com/raghudevopsb79/tf-module-app.git"
#
#   instance_type      = var.components["backend"]["instance_type"]
#   name               = var.components["backend"]["name"]
#   disk_size          = var.components["backend"]["disk_size"]
#   env                = var.env
#   port_no            = var.components["backend"]["port_no"]
#   vault_token        = var.vault_token
#   SSH_PASSWORD       = var.SSH_PASSWORD
#   prometheus_servers = var.prometheus_servers
#   zone_id            = data.aws_route53_zone.main.zone_id
# }
#
# module "mysql" {
#   source = "git::https://github.com/raghudevopsb79/tf-module-app.git"
#
#   instance_type      = var.components["mysql"]["instance_type"]
#   name               = var.components["mysql"]["name"]
#   disk_size          = var.components["mysql"]["disk_size"]
#   env                = var.env
#   port_no            = var.components["mysql"]["port_no"]
#   vault_token        = var.vault_token
#   SSH_PASSWORD       = var.SSH_PASSWORD
#   prometheus_servers = var.prometheus_servers
#   zone_id            = data.aws_route53_zone.main.zone_id
# }
#

module "vpc" {
  source = "git::https://github.com/raghudevopsb79/tf-module-vpc.git"

  for_each         = var.vpc
  vpc_cidr_block   = each.value["vpc_cidr_block"]
  lb_subnet_cidr   = each.value["lb_subnet_cidr"]
  eks_subnet_cidr  = each.value["eks_subnet_cidr"]
  db_subnet_cidr   = each.value["db_subnet_cidr"]
  azs              = each.value["azs"]
  default_vpc_id   = each.value["default_vpc_id"]
  default_vpc_cidr = each.value["default_vpc_cidr"]
  default_vpc_rt   = each.value["default_vpc_rt"]

  tags = var.tags
  env  = var.env
}

module "eks" {
  source = "git::https://github.com/raghudevopsb79/tf-module-eks.git"

  for_each    = var.eks
  eks_version = each.value["eks_version"]
  node_groups = each.value["node_groups"]

  subnet_ids = module.vpc["main"].eks_subnet_ids

  tags = var.tags
  env  = var.env
}

