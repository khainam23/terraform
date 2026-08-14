resource "aws_eip" "private_eip_1" {
  domain = "vpc"
}

resource "aws_eip" "private_eip_2" {
  domain = "vpc"
}