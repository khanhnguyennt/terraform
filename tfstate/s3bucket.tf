
provider "aws" {

  region = "ap-southeast-1"

}
# terraform state file setup
# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "bucket-terraform" {
    bucket = "terraform-remote-state-storage-s3-371835366947"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
    }
 
    tags = {
      Name = "S3 Remote Terraform State Store"
    }      
}
# example.tf
# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform" {
  name = "terraform-dynamo"
  hash_key = "LockID"
   billing_mode     = "PAY_PER_REQUEST"
   
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}