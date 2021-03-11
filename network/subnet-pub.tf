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
