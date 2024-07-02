terraform {
  backend "s3" {}
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.11.1"
    }
  }
}

provider "http" {}

provider "kubectl" {}

