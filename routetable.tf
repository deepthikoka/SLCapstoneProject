resource "aws_route_table" "capstone_public_rt" {
   vpc_id = aws_vpc.capstone_vpc.id
   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = "aws_internet_gateway.capstone-igw.id"
   }
   tags = {
     Name = "capstone_project3_public_rt"
  }
}
