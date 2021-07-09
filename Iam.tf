resource "aws_iam_role" "iamrole_main" {
  name                  = "${var.name}-iam-role"
  assume_role_policy    = data.aws_iam_policy_document.role.json
  force_detach_policies = true
  path                  = "/"

  tags = {
    Name = var.name
  }
}

resource "aws_iam_policy" "iampolicy_main" {
  name   = "${var.name}-iam-policy"
  role   = aws_iam_role.iamrole_main.id
  policy = data.aws_iam_policy_document.role_policy_cloudwatch.json

  lifecycle {
    create_before_destroy = true
  }
}
