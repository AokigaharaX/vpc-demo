variable "azs" {
  description = "List of availability zones to create VPC"
  type        = list(string)
  default     = []
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "enable_dns_hostnames" {
  description = "Enable dns hostnames for VPC"
  type        = bool
  default     = false
}

variable "enable_flow_log" {
  description = "Enable VPC Flow Log"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
