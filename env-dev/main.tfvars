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
    vpc_cidr_block = "10.0.0.0/16"
  }
}