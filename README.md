# terraform-project

This Template used to create and deploy a webserver ,hosting a single static page .
                                     
Assumptions:-
1. EIP - 55.55.55.55
    If this was mentioned as an example, I think my code is perfect. 
    If not, to have this dedicate Public IP, we need to bring our own customer-owned address pool.
    We need to add a block like this to the existing code.

    resource "aws_eip" "byoip-ip" {
        vpc              = true
        public_ipv4_pool = "ipv4pool-ec2-012345"
    }

2. deploy_to_aws.sh
    This script is written assuming the aws credentails are already setup ( ~/.aws/credentials ) using command "aws configure".
    So that the bash prompt is already loaded with the required profile and runs the terraform code without errors.
