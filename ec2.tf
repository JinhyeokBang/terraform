resource "aws_instance" "terraform_ec2" {
  ami = "ami-09a7535106fbd42d5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.terraform_public_subnet_1.id
  associate_public_ip_address = true
  key_name = aws_key_pair.terraform_key_pair.key_name
  tags = {
    Name = "my_ec2"
  }
  vpc_security_group_ids = [
    aws_security_group.terraform_security_group.id,
  ]
}
