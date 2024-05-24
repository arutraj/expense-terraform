terraform init -backend-config=env-${env}/state.tfvars
terraform ${action} -auto-approve -var-file=env-${env}/main.tfvars -var vault_token=${vault_token} -var SSH_PASSWORD=${SSH_PASSWORD}
