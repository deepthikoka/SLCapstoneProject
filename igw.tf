resource "aws_internet_gateway" "capstone-igw" {
  vpc_id = aws_vpc.capstone_vpc.id
  tags = {
     Name = "capstone-project3-igw"
  }
}


