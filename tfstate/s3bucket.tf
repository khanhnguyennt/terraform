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
