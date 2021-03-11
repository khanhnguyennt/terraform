resource "aws_subnet" "pub" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = data.aws_availability_zones.main.names[count.index] # ["ap-southeast-1a","ap-southeast-1b","ap-southeast-1c"]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${var.zone_characters[count.index]}"
  }
}

# variable "public_subnets" {
#   default = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
# }

variable "zone_characters" {
  default = ["a", "b", "c"]
}