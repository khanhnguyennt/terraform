terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-storage-s3-371835366947"
    dynamodb_table = "terraform-dynamo"
    region         = "ap-southeast-1"
    key            = "fe.tfstate"
  }
}