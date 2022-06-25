resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name

  tags = {
    Name         = var.bucket_name
    Environment  = "Dev"
    Github_Owner = "ftieben" # Its always usefull to know where the Terraformm code is stored
    Github_Repo  = "nocode-terraform"
  }
}

resource "aws_s3_bucket_acl" "mybucket" {
  bucket = aws_s3_bucket.mybucket.id
  acl    = "private"
}

resource "aws_s3_bucket_metric" "mybucket" {
  count  = var.metrics_enabled == true ? 1 : 0
  bucket = aws_s3_bucket.mybucket.bucket
  name   = "EntireBucket"
}

resource "aws_s3_bucket_logging" "mybucket" {
  bucket        = aws_s3_bucket.mybucket.id
  target_bucket = var.log_bucket_id
  target_prefix = "log/s3/${var.bucket_name}/"
}
