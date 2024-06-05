data "aws_caller_identity" "current" {}

resource "random_integer" "priority" {
  min = 100000
  max = 500000
}
