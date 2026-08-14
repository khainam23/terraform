resource "aws_s3_bucket_lifecycle_configuration" "lab2_bucket_log_lifecycle" {
  bucket = aws_s3_bucket.lab2_bucket_log.id

  rule {
    id = "move-to-glacier"
    status = "Enabled"

    filter {}

    transition {
      days          = 30
      storage_class = "GLACIER"
    }
  }
}