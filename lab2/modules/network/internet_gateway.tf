resource "aws_internet_gateway" "lab2_igw" {
  vpc_id = aws_vpc.lab2_vpc.id

  tags = {
    Name = "lab2_internet_gateway"
  }
}