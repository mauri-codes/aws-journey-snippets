resource "aws_lambda_function" "function" {
  depends_on    = [data.archive_file.lambda]
  filename      = "${path.module}/lambda/package.zip"
  function_name = "ImagesTransform"
  role          = aws_iam_role.images_transform.arn
  handler       = "transform.handler"
  timeout       = 10
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.9"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "./lambda/package"
  output_path = "./lambda/package.zip"
}

resource "aws_s3_bucket_notification" "trigger" {
  bucket = local.bucket_name

  lambda_function {
    lambda_function_arn = aws_lambda_function.function.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "images/"
    filter_suffix       = ".jpg"
  }
}

resource "aws_lambda_permission" "test" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${local.bucket_name}"
}
