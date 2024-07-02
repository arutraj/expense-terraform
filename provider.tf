terraform {
  backend "s3" {}
}

provider "http" {}
provider "gavinbunney/kubectl" {}
