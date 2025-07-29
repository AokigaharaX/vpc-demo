resource "aws_vpc" "rg" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.tags,
    {
      Name = "${local.environment}-VPC"
    }
  )
}

module "flow_log" {
  count  = var.enable_flow_log ? 1 : 0
  source = "./flow_log"
  vpc_id = aws_vpc.rg.id
  tags   = var.tags
}
