Copyright (C) 2025 ABC Inc.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.7.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_flow_log"></a> [flow\_log](#module\_flow\_log) | ./flow_log | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eip.natgw](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/eip) | resource |
| [aws_internet_gateway.rg](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.rg](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/nat_gateway) | resource |
| [aws_route.private_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/route) | resource |
| [aws_route.public_internet_access](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/subnet) | resource |
| [aws_vpc.rg](https://registry.terraform.io/providers/hashicorp/aws/6.2.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | List of availability zones to create VPC | `list(string)` | `[]` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Enable dns hostnames for VPC | `bool` | `false` | no |
| <a name="input_enable_flow_log"></a> [enable\_flow\_log](#input\_enable\_flow\_log) | Enable VPC Flow Log | `bool` | `true` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of CIDR blocks for private subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of CIDR blocks for public subnets | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to resources | `map(string)` | `{}` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#output\_private\_subnet\_cidrs) | CIDRs of private subnet |
| <a name="output_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#output\_public\_subnet\_cidrs) | CIDRs of public subnet |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | ARN of VPC created |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | CIDR of VPC created |
| <a name="output_vpc_flow_log_bucket"></a> [vpc\_flow\_log\_bucket](#output\_vpc\_flow\_log\_bucket) | S3 bucket which stores the VPC flow log |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of VPC created |
<!-- END_TF_DOCS -->
