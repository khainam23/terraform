resource "aws_nat_gateway" "lab2_ng_1" {
  allocation_id = aws_eip.private_eip_1.id
  subnet_id     = aws_subnet.private_subnet_1.id

  tags = {
    Name = "lab2_nat_gateway_1"
  }
}

resource "aws_nat_gateway" "lab2_ng_2" {
  allocation_id = aws_eip.private_eip_2.id
  subnet_id     = aws_subnet.private_subnet_2.id

  tags = {
    Name = "lab2_nat_gateway_2"
  }
}
