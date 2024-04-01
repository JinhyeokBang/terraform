resource  "aws_security_group"  "terraform_public_security_group" {
  name = "${var.project_name}_public_security_group"                                                       
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
  egress {
    protocol    = "-1"
    from_port   = 0    
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]    
  }
}

resource  "aws_security_group"  "terraform_private_security_group" {
  name = "${var.project_name}_private_security_group"                                                       
  description = "security group for rds"        
  vpc_id = aws_vpc.terraform_vpc.id                    
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol    = "-1"
    from_port   = 0    
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]    
  }
}
