resource "aws_route_table" "priv" {
  vpc_id = aws_vpc.main.id
  count  = length(var.private_subnets)
  route {

    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[count.index].id
  }



  tags = {
    Name = "${var.environment}-route-priv-${var.zone_characters[count.index]}"
  }
}

resource "aws_route_table_association" "priv" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.priv[count.index].id
  route_table_id = aws_route_table.priv[count.index].id
}