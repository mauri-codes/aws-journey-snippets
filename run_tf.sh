#!/bin/bash
# cd ~ && wget -O run.sh "https://raw.github.com/mauri-codes/aws-journey-snippets/main/run_tf.sh" && source run.sh new_account_admin

PROJECT=$1

cd ~
if terraform --version ; then
    echo "Terraform Already Installed"
else
    sudo yum install -y yum-utils shadow-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform
fi

if [ -f snippets ]; then
    cd snippets
    git pull origin main
else
    git clone https://github.com/mauri-codes/aws-journey-snippets.git snippets
    cd snippets
fi

cd $PROJECT
terraform init
terraform apply -auto-approve

if [ -f run.sh ]; then
    source run.sh
else
    echo "--"
fi
