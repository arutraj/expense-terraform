terraform {
  backend "s3" {}
}

provider "http" {}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "${var.env}-eks"
}

