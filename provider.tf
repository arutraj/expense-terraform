terraform {
  backend "s3" {}
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
    }
  }
}

provider "http" {}

provider "kubectl" {
  load_config_file = true
}
