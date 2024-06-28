# env = "dev"
#
# components = {
#   frontend = {
#     name          = "frontend"
#     instance_type = "t3.small"
#     port_no       = 80
#     disk_size     = 25
#   }
#
#   mysql = {
#     name          = "mysql"
#     instance_type = "t3.small"
#     port_no       = 3306
#     disk_size     = 25
#   }
#
#   backend = {
#     name          = "backend"
#     instance_type = "t3.small"
#     port_no       = 8080
#     disk_size     = 25
#   }
#
# }
#
# prometheus_servers = ["172.31.35.0/32"]

env = "dev"

vpc = {
  main = {
    vpc_cidr_block  = "10.0.0.0/16"
    web_subnet_cidr = ["10.0.0.0/24", "10.0.1.0/24"]
    app_subnet_cidr = ["10.0.2.0/24", "10.0.3.0/24"]
    db_subnet_cidr  = ["10.0.4.0/24", "10.0.5.0/24"]
    azs             = ["us-east-1a", "us-east-1b"]
  }
}

tags = {
  project_name = "Expense"
  bu_unit      = "finance"
  env          = "dev"
  created_with = "Terraform"
}