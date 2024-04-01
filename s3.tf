resource "aws_s3_bucket" "terraform_s3_bucket" {
  bucket = "${var.project_name}-s3-bucket"

  tags = {
    Name = "${var.project_name}-s3-bucket"
  }
}
