# Terraform configuration for all infrastructure

## Backend folder 
To create ECS cluster, service, task definition and ALB

## Frontend folder
To create Cloudfront, S3 bucket

## Network folder
To create VPC, Public and Private subnets, Internet gateway, NAT gateway

## Tfstate folder
To create S3 for terraform remote state and Dynamodb table for locking state

## Terraform's commands
```
cd network
terraform init
terraform workspace new dev
terraform plan -var-file=dev
terraform apply -var-file=dev --auto-approve
```