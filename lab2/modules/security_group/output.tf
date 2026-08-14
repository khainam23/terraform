output "lab2_public_sg_id" {
  value = aws_security_group.lab2_public_sg.id
}

output "lab2_private_sg_id" {
  value = aws_security_group.lab2_private_sg.id
}
