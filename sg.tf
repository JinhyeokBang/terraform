resource  "aws_security_group"  "terraform_security_group" {
  name = "terraform_security_group"                                                       
  description = "security group for ec2"        
  vpc_id = aws_vpc.terraform_vpc.id                            
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}
