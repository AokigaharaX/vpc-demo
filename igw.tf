resource "aws_internet_gateway" "rg" {
  vpc_id = aws_vpc.rg.id
  tags = merge(
    var.tags,
    {
      Name = "${local.environment}-IGW"
    }
  )
}
