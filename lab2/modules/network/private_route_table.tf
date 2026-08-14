resource "aws_route_table" "private_route_table_1" {
  vpc_id = aws_vpc.lab2_vpc.id

  route {
    cidr_block = aws_subnet.private_subnet_1.cidr_block
    nat_gateway_id = aws_nat_gateway.lab2_ng_1.id
  }

  tags = {
    Name = "lab2_private_route_table_1"
  }
}

resource "aws_route_table_association" "private_subnet_1_assoc" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table_1.id
}

# =================================================================

resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.lab2_vpc.id

  route {
    cidr_block = aws_subnet.private_subnet_2.cidr_block
    nat_gateway_id = aws_nat_gateway.lab2_ng_2.id
  }

  tags = {
    Name = "lab2_private_route_table_2"
  }
}

resource "aws_route_table_association" "private_subnet_2_assoc" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table_2.id
}
