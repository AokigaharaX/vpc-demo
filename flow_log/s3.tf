# Generate a random suffix in case the tags provided does not contain required information
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "flow_log" {
  bucket = local.flow_log_bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "flow_log_block" {
  bucket = aws_s3_bucket.flow_log.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "flow_log_policy" {
  bucket = aws_s3_bucket.flow_log.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AWSLogDeliveryAclCheck",
        Effect    = "Allow",
        Principal = { Service = "delivery.logs.amazonaws.com" },
        Action    = "s3:GetBucketAcl",
        Resource  = aws_s3_bucket.flow_log.arn
      },
      {
        Sid       = "AWSLogDeliveryWrite",
        Effect    = "Allow",
        Principal = { Service = "delivery.logs.amazonaws.com" },
        Action    = "s3:PutObject",
        Resource  = "${aws_s3_bucket.flow_log.arn}/AWSLogs/*"
      }
    ]
  })
}
