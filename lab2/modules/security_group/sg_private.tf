resource "aws_security_group" "lab2_private_sg" {
  name        = "lab2_private_sg"
  description = "Security group for private"
  vpc_id      = var.lab2_vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}