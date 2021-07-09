 lifecycle {
    create_before_destroy = true
  }
}

# Create NAT Gateway
resource "aws_nat_gateway" "public_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "NAT Gateway"
  }

  depends_on = [aws_internet_gateway.igw_main]
  lifecycle {
    create_before_destroy = true
  }
}


# private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = "Private-RouteTable"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.public_nat.id
  }
}
