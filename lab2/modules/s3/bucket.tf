resource "aws_s3_bucket" "lab2_bucket_log" {
  bucket = "lab2-bucket-terraform"

  tags = {
    Name        = "lab2_bucket_log"
    Environment = "Lab2"
  }
}

resource "aws_s3_bucket_versioning" "lab2_bucket_log_versioning" {
  bucket = aws_s3_bucket.lab2_bucket_log.id

  versioning_configuration {
    status = "Enabled"
  }
}