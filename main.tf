module "frontend" {
  depends_on = [module.backend]
  source     = "git::https://github.com/raghudevopsb79/tf-module-app.git"

  instance_type      = var.components["frontend"]["instance_type"]
  name               = var.components["frontend"]["name"]
  env                = var.env
  port_no            = var.components["frontend"]["port_no"]
  disk_size          = var.components["frontend"]["disk_size"]
  vault_token        = var.vault_token
  SSH_PASSWORD       = var.SSH_PASSWORD
  prometheus_servers = var.prometheus_servers
  zone_id            = data.aws_route53_zone.main.zone_id
}

module "backend" {
  depends_on = [module.mysql]
  source     = "git::https://github.com/raghudevopsb79/tf-module-app.git"

  instance_type      = var.components["backend"]["instance_type"]
  name               = var.components["backend"]["name"]
  disk_size          = var.components["backend"]["disk_size"]
  env                = var.env
  port_no            = var.components["backend"]["port_no"]
  vault_token        = var.vault_token
  SSH_PASSWORD       = var.SSH_PASSWORD
  prometheus_servers = var.prometheus_servers
  zone_id            = data.aws_route53_zone.main.zone_id
}

module "mysql" {
  source = "git::https://github.com/raghudevopsb79/tf-module-app.git"

  instance_type      = var.components["mysql"]["instance_type"]
  name               = var.components["mysql"]["name"]
  disk_size          = var.components["mysql"]["disk_size"]
  env                = var.env
  port_no            = var.components["mysql"]["port_no"]
  vault_token        = var.vault_token
  SSH_PASSWORD       = var.SSH_PASSWORD
  prometheus_servers = var.prometheus_servers
  zone_id            = data.aws_route53_zone.main.zone_id
}

