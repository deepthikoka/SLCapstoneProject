resource "aws_security_group" "capstone_sg" {
    name = "capstone_project3_sg" 
    vpc_id = aws_vpc.capstone_vpc.id
    
    ingress {
       description = "Allow http"
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
       description = "Allow SSH"
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
       description = "Allow all outgoing"
       from_port = 0
       to_port = 0
       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
      Name = "capstone-project3-sg"
  }

}
