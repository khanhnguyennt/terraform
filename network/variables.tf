variable "environment" {}
variable "vpc_cidr" {}

variable "private_subnets" {}
variable "public_subnets" {}

variable "zone_characters" {
  default = ["a", "b", "c"]
}