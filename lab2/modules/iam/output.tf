output "lab2_iam_role_log" {
  value = aws_iam_role.lab2_role_log.arn
}

output "lab2_iam_role_log_id" {
  value = aws_iam_role.lab2_role_log.id
}

output "lab2_instance_profile_id" {
  value = aws_iam_instance_profile.lab2_instance_profile.id
}

output "lab2_instance_profile_name" {
  value = aws_iam_instance_profile.lab2_instance_profile.name
}