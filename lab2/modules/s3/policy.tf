resource "aws_s3_bucket_policy" "lab2_bucket_log_policy" {
  bucket = aws_s3_bucket.lab2_bucket_log.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          AWS = var.lab2_iam_role_log
        }

        Action = [
            "s3:PutObject",
            "s3:GetObject"
        ]

        Resource = "${aws_s3_bucket.lab2_bucket_log.arn}/*"
      },
      {
        Effect = "Allow"

        Principal = {
          AWS = var.lab2_iam_role_log
        }

        Action = [
            "s3:ListBucket"
        ]

        Resource = aws_s3_bucket.lab2_bucket_log.arn
      }
    ]
  })
}