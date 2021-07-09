resource "random_id" "randomId" {
  byte_length = 1
  keepers = {
    cidr_block = "10.0.0.0/16"
  }
}

resource "aws_flow_log" "flowlog_main" {
  iam_role_arn    = aws_iam_role.iamrole_main.arn
  log_destination = aws_cloudwatch_log_group.flow_log_main.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc_main.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_log_group" "flow_log_main" {
  name              = "${var.name}-flow-log"
  retention_in_days = 14

  tags = {
    Name = var.Name
  }

  lifecycle {
    create_before_destroy = true
  }
}

# resource "aws_s3_bucket" "flowlog_s3_bucket" {
#   bucket = "${var.name}-flow-log-${random_id.randomId.hex}"

#   tags = {
#     Name = "S3Bucket-Flowlogs"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }
