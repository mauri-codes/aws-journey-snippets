locals {
  account_id  = data.aws_caller_identity.current.account_id
  bucket_name = var.bucket_name != "" ? var.bucket_name : "infrastructure-$random_integer.priority.result"
}