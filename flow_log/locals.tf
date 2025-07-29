locals {
  flow_log_bucket_name = (
    contains(keys(var.tags), "Environment") && contains(keys(var.tags), "Project")
  ) ? lower("${var.tags["Environment"]}-${var.tags["Project"]}-flow-logs") : lower("${random_id.bucket_suffix.hex}-flow-logs")
}
