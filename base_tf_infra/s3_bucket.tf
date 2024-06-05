resource "aws_s3_bucket" "infrastructure" {
  bucket = "aws-journey-infrastructure"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "infrastructure" {
  bucket = aws_s3_bucket.infrastructure.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "backup" {
  bucket = aws_s3_bucket.infrastructure.id

  rule {
    id     = "remove-old-versions"
    status = "Enabled"
    noncurrent_version_expiration {
      newer_noncurrent_versions = 3
      noncurrent_days = 30
    }
  }
}
