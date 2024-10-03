
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "images_transform" {
  name = "ImagesTransformRole"
  managed_policy_arns = [
    aws_iam_policy.lambda_logs.arn,
    aws_iam_policy.s3_access.arn
  ]
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


resource "aws_iam_policy" "lambda_logs" {
  name        = "LambdaLogsPolicy"
  description = "Access CloudWatch Logs"


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:PutLogEvents",
          "logs:CreateLogGroup",
          "logs:CreateLogStream"
        ],
        "Resource" : "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access" {
  name        = "S3AccessPolicy"
  description = "Access S3 PUT and GET Object"


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject"
        ],
        "Resource" : "arn:aws:s3:::${local.bucket_name}/images/*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject"
        ],
        "Resource" : "arn:aws:s3:::${local.bucket_name}/transformed/*"
      }
    ]
  })
}
