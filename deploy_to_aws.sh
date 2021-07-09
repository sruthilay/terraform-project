#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./deploy_to_aws.sh deploy|destroy"
fi

# cleanup activity
rm -rf .terraform
terraform --version

# Initialise the Configuration
terrafrom init -input=false

if [ "$1" == "deploy" ]; then

    # Plan and Deploy
    terraform validate
    terraform plan -input=false -out=tfplan
    terraform apply -auto-approve tfplan

elif [ "$1" == "destroy" ]; then

    # destroy exising resources
    terraform destroy -auto-approve tfplan
fi

# Terraform will run and you can find the results in terraform ouput
