resource "aws_iam_role_policy" "lab2_role_log_policy" {
    name = "lab2_role_log_policy"
    role = aws_iam_role.lab2_role_log.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:PutObject",
          "s3:GetObject"
        ]

        Resource = "${var.lab2_bucket_log_arn}/*"
      },
      {
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = var.lab2_bucket_log_arn
      }
    ]
  })
}

resource "aws_iam_instance_profile" "lab2_instance_profile" {
    name = "lab2_instance_profile"
    role = aws_iam_role.lab2_role_log.name
}