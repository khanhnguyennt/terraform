data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket         = "terraform-remote-state-storage-s3-371835366947"
    region         = "ap-southeast-1"
    key            = "env:/${var.environment}/network.tfstate"
  }
}
