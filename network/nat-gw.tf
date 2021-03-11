resource "aws_eip" "main" {
  count = length(var.public_subnets)
  vpc   = true
  tags = {
    Name = "Eip-${var.zone_characters[count.index]}"
  }
}

resource "aws_nat_gateway" "main" {
  count         = length(var.public_subnets)
  allocation_id = aws_eip.main[count.index].id
  subnet_id     = aws_subnet.pub[count.index].id

  tags = {
    Name = "nat-gw-${var.zone_characters[count.index]}"
  }

}