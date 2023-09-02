resource "aws_subnet" "capstone_subnet_a" {
   vpc_id = aws_vpc.capstone_vpc.id
   cidr_block = "10.0.1.0/24"
   availability_zone = "us-east-1a"
   tags = {
  	Name = "subnet_a"
   }
}

resource "aws_subnet" "capstone_subnet_b" {
   vpc_id = aws_vpc.capstone_vpc.id
   cidr_block = "10.0.2.0/24"
   availability_zone = "us-east-1b"
   tags = {
        Name = "subnet_b"
   }
}

resource "aws_subnet" "capstone_subnet_c" {
   vpc_id = aws_vpc.capstone_vpc.id
   cidr_block = "10.0.3.0/24"
   availability_zone = "us-east-1c"
   tags = {
        Name = "subnet_c"
   }
}

