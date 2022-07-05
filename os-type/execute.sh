terraform init

 #run all terraform related rituals"
terraform fmt
#terraform init -backend=true -backend-config="bucket=$1"
terraform plan
#echo "yes" | terraform apply
terraform apply --auto-approve

terraform output -raw admin_ssh_key_public
terraform output -raw admin_ssh_key_private
