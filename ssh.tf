resource "tls_private_key" "terraform_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform_key_pair" {
  key_name   = "terraform-keypair.pem"
  public_key = tls_private_key.terraform_key.public_key_openssh
} 

resource "local_file" "terraform_key_file" {
  filename        = "./keypair/terraform-keypair.pem"
  content         = tls_private_key.terraform_key.private_key_pem
  file_permission = "0600"
}
