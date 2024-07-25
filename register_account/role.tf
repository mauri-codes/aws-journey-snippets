locals {
  random_id = random_string.random.id
}
resource "aws_iam_role" "aws_journey_role" {
  name               = "AWS_JOURNEY_ROLE_${random_id}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.journey_assume_role_policy.json
  managed_policy_arns = [
    aws_iam_policy.additional_permissions.arn,
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]
}

data "aws_iam_policy_document" "journey_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["992382705642", "891377377951"]
    }
  }
}

resource "aws_iam_policy" "additional_permissions" {
  name = "JOURNEY_PERMISSIONS_${random_id}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["lambda:InvokeFunction"]
        Effect   = "Allow"
        Resource = "arn:aws:lambda:*:*:function:*"
      },
      {
        Action   = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "random_string" "random" {
  length           = 4
  special          = false
}
