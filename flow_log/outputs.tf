output "s3_bucket" {
  description = "S3 bucket which stores the VPC flow log"
  value       = local.flow_log_bucket_name
}
