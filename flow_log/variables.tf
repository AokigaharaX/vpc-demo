variable "vpc_id" {
  description = "VPC ID for which the flowlogs are enabled"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
