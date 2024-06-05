output "access_keys_secret" {
  value = aws_iam_access_key.access_keys.secret
  sensitive = true
}
output "access_keys_id" {
  value = aws_iam_access_key.access_keys.id
}
output "user_password" {
  value =  aws_iam_user_login_profile.console_access.encrypted_password
  sensitive = true
}
