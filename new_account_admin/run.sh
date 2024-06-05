#!/bin/bash
# cd ~ && wget -O run.sh "https://raw.github.com/mauri-codes/aws-journey-snippets/main/new_account_admin/run.sh" && source run.sh

cd ~
if terraform --version ; then
    echo "Terraform Already Installed"
else
    sudo yum install -y yum-utils shadow-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform
fi

if [ -f snippets ]; then
    echo "Repo Already Cloned"
else
    git clone https://github.com/mauri-codes/aws-journey-snippets.git snippets
fi

cd snippets/new_account_admin
terraform init
terraform apply -auto-approve
echo ACCESS_KEY_ID: `terraform output access_keys_id`
echo ACCESS_KEY_SECRET: `terraform output access_keys_secret`
echo USER_PASSWORD: `terraform output user_password`
