
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.57.1"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
  # Test nên tạm thời để key ở đây
  access_key = "..."
  secret_key = "..."
}

# -------------------------
# VPC
# -------------------------
resource "aws_vpc" "lab1_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "lab1_vpc"
  }
}

# -------------------------
# Internet Gateway
# -------------------------
resource "aws_internet_gateway" "lab1_igw" {
  vpc_id = aws_vpc.lab1_vpc.id

  tags = {
    Name = "lab1_igw"
  }
}

# -------------------------
# Subnets 1
# -------------------------
resource "aws_subnet" "lab1_private_1" {
  vpc_id            = aws_vpc.lab1_vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "lab1_private_1"
  }
}

resource "aws_subnet" "lab1_public_1" {
  vpc_id            = aws_vpc.lab1_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "lab1_public_1"
  }
}

# -------------------------
# Subnets 2
# -------------------------
resource "aws_subnet" "lab1_private_2" {
  vpc_id            = aws_vpc.lab1_vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "lab1_private_2"
  }
}

resource "aws_subnet" "lab1_public_2" {
  vpc_id            = aws_vpc.lab1_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "lab1_public_2"
  }
}

# -------------------------
# Elastic IP
# -------------------------
resource "aws_eip" "lab1_eip_net1" {
  domain = "vpc"
}

resource "aws_eip" "lab1_eip_net2" {
  domain = "vpc"
}

# -------------------------
# NAT Gateway
# -------------------------
resource "aws_nat_gateway" "lab1_public_gw1" {
  allocation_id = aws_eip.lab1_eip_net1.id
  subnet_id     = aws_subnet.lab1_public_1.id

  depends_on = [aws_internet_gateway.lab1_igw]

  tags = {
    Name = "lab1_public_gw1"
  }
}

resource "aws_nat_gateway" "lab1_public_gw2" {
  allocation_id = aws_eip.lab1_eip_net2.id
  subnet_id     = aws_subnet.lab1_public_2.id

  depends_on = [aws_internet_gateway.lab1_igw]

  tags = {
    Name = "lab1_public_gw2"
  }
}

# -------------------------
# Public Route Table
# -------------------------
resource "aws_route_table" "lab1_public_tb" {
  vpc_id = aws_vpc.lab1_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab1_igw.id
  }

  tags = {
    Name = "lab1_public_tb"
  }
}

resource "aws_route_table_association" "lab1_public_1_assoc" {
  subnet_id      = aws_subnet.lab1_public_1.id
  route_table_id = aws_route_table.lab1_public_tb.id
}

resource "aws_route_table_association" "lab1_public_2_assoc" {
  subnet_id      = aws_subnet.lab1_public_2.id
  route_table_id = aws_route_table.lab1_public_tb.id
}

# -------------------------
# Private Route Table 1
# -------------------------
resource "aws_route_table" "lab1_private_tb1" {
  vpc_id = aws_vpc.lab1_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.lab1_public_gw1.id
  }

  tags = {
    Name = "lab1_private_tb1"
  }
}

resource "aws_route_table_association" "lab1_private_1_assoc" {
  subnet_id      = aws_subnet.lab1_private_1.id
  route_table_id = aws_route_table.lab1_private_tb1.id
}

# -------------------------
# Private Route Table 2
# -------------------------
resource "aws_route_table" "lab1_private_tb2" {
  vpc_id = aws_vpc.lab1_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.lab1_public_gw2.id
  }

  tags = {
    Name = "lab1_private_tb2"
  }
}

resource "aws_route_table_association" "lab1_private_2_assoc" {
  subnet_id      = aws_subnet.lab1_private_2.id
  route_table_id = aws_route_table.lab1_private_tb2.id
}

# -------------------------
# EC2 Instance
# -------------------------
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "lab1_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.lab1_private_1.id

  tags = {
    Name = "lab1_ec2"
  }
}