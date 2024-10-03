resource "aws_s3_bucket" "infrastructure" {
  bucket        = local.bucket_name
  force_destroy = true
}
