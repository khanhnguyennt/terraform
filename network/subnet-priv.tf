resource "aws_subnet" "priv" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = data.aws_availability_zones.main.names[count.index] # ["ap-southeast-1a","ap-southeast-1b","ap-southeast-1c"]

  tags = {
    Name = "priv-${var.zone_characters[count.index]}"
  }
}

# variable "private_subnets" {
#   default = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]
# }

