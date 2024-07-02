terraform {
  backend "s3" {}
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "http" {}

provider "kubectl" {
  load_config_file = true
}
