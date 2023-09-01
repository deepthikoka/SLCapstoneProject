resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.capstone_subnet_a.id
  route_table_id = aws_route_table.capstone_public_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id = aws_subnet.capstone_subnet_b.id
  route_table_id = aws_route_table.capstone_public_rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id = aws_subnet.capstone_subnet_c.id
  route_table_id = aws_route_table.capstone_public_rt.id
}

