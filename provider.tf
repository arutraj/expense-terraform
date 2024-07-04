terraform {
  backend "s3" {}
}

provider "http" {}

provider "vault" {
  address         = "https://vault-internal.rdevopsb79.online:8200"
  token           = var.vault_token
  skip_tls_verify = true
}

