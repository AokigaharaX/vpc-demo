resource "aws_eip" "natgw" {
  tags = merge(
    var.tags,
    {
      Name = "${local.environment}-NAT"
    }
  )
}

resource "aws_nat_gateway" "rg" {
  allocation_id = aws_eip.natgw.id
  subnet_id     = aws_subnet.public[local.first_az].id
  tags = merge(
    var.tags,
    {
      Name = "${local.environment}-NAT"
    }
  )
}
