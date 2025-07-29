resource "aws_flow_log" "rg" {
  log_destination      = aws_s3_bucket.flow_log.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = var.vpc_id
  tags                 = var.tags
}
