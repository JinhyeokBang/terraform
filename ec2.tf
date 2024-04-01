resource "aws_instance" "terraform_ec2" {
  ami = var.ec2_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.terraform_public_subnet_1.id
  associate_public_ip_address = true
  key_name = aws_key_pair.terraform_key_pair.key_name
    user_data = <<-EOL
  #!/bin/bash -xe
  sudo apt update -y
  sudo apt install nginx git -y
  sudo systemctl enable nginx
  sudo systemctl start nginx
  EOL
  tags = {
    Name = "${var.project_name}_ec2"
  }
  vpc_security_group_ids = [
    aws_security_group.terraform_public_security_group.id,
  ]
}
