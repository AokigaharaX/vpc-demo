output "vpc_id" {
  description = "ID of VPC created"
  value       = aws_vpc.rg.id
}

output "vpc_arn" {
  description = "ARN of VPC created"
  value       = aws_vpc.rg.arn
}

output "vpc_cidr" {
  description = "CIDR of VPC created"
  value       = aws_vpc.rg.cidr_block
}

output "private_subnet_cidrs" {
  description = "CIDRs of private subnet"
  value       = var.private_subnets
}

output "public_subnet_cidrs" {
  description = "CIDRs of public subnet"
  value       = var.public_subnets
}

output "vpc_flow_log_bucket" {
  description = "S3 bucket which stores the VPC flow log"
  value       = var.enable_flow_log ? module.flow_log[0].s3_bucket : "disabled"
}
