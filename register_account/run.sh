#!/bin/bash

export ROLE_ARN="$(terraform output -raw role_arn)"
export ACCOUNT_ID=`aws sts get-caller-identity --query Account --output text`
export ALIAS=$ALIAS
export TOKEN=$TOKEN
export ATOKEN=$ATOKEN
export ROLE_ARN=$ROLE_ARN
export REGION=$REGION

python3 register.py

#REGION=<REGION> ALIAS=<ALIAS> TOKEN=<TOKEN> ATOKEN=<ATOKEN> source run.sh register_account
#ENV=<ENV> REGION=<REGION> ALIAS=<ALIAS> TOKEN=<TOKEN> ATOKEN=<ATOKEN> source run.sh register_account
