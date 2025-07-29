resource "aws_subnet" "public" {
  for_each = { for idx, az in var.azs : az => var.public_subnets[idx] }

  vpc_id                              = aws_vpc.rg.id
  cidr_block                          = each.value
  availability_zone                   = each.key
  map_public_ip_on_launch             = false
  private_dns_hostname_type_on_launch = "ip-name"
  tags = merge(
    var.tags,
    {
      Name = "${local.environment}-WAN-${each.key}"
    }
  )
}

resource "aws_subnet" "private" {
  for_each = { for idx, az in var.azs : az => var.private_subnets[idx] }

  vpc_id                              = aws_vpc.rg.id
  cidr_block                          = each.value
  availability_zone                   = each.key
  map_public_ip_on_launch             = false
  private_dns_hostname_type_on_launch = "ip-name"
  tags = merge(
    var.tags,
    {
      Name = "${local.environment}-LAN-${each.key}"
    }
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.rg.id
  tags = merge(
    var.tags,
    {
      Name = "${local.environment}-RT-WAN"
    }
  )
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.rg.id
}

resource "aws_route_table" "private" {
  for_each = aws_subnet.private

  vpc_id = aws_vpc.rg.id
  tags = merge(
    var.tags,
    {
      Name = "${local.environment}-RT-LAN"
    }
  )
}

resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[each.key].id
}

resource "aws_route" "private_nat_gateway" {
  for_each = aws_route_table.private

  route_table_id         = each.value.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.rg.id
}
