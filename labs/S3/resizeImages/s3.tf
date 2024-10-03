resource "aws_s3_bucket" "images" {
  bucket        = local.bucket_name
  force_destroy = true
}
