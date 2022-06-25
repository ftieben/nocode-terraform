
resource "aws_s3_bucket_versioning" "mybucket" {
  count  = var.versioningx_enabled == true ? 1 : 0
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "versioning-bucket-config" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.mybucket]

  bucket = aws_s3_bucket.mybucket.bucket

  rule {
    id = "old-versions"

    noncurrent_version_expiration {
      noncurrent_days = 90
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = 60
      storage_class   = "GLACIER"
    }

    status = "Enabled"
  }
}