resource "aws_iam_user" "admin" {
  name = "admin"
}

resource "aws_iam_group" "admins" {
  name = "admins"
}

resource "aws_iam_group_policy_attachment" "administrator_access" {
  group      = "${aws_iam_group.admins.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "access_keys" {
  user    = aws_iam_user.admin.name
}

resource "aws_iam_user_login_profile" "console_access" {
  user    = aws_iam_user.admin.name
}
