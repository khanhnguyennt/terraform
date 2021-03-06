resource "aws_route_table" "pub" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }



  tags = {
    Name = "${var.environment}-route-pub"
  }
}

resource "aws_route_table_association" "a" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.pub[count.index].id
  route_table_id = aws_route_table.pub.id
}