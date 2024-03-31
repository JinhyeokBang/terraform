resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "terraform_public_subnet_1" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "my_public_subnet_1"
  }
}

resource "aws_subnet" "terraform_public_subnet_2" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2b"
  tags = {
    Name = "my_public_subnet_2"
  }
}

resource "aws_internet_gateway" "terraform_internet_gateway" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "my_internet_gateway"
  }
}

resource "aws_route_table" "terraform_public_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "my_route_table"
  }
}

resource "aws_route_table_association" "terraform_public_route_association_1" {
  subnet_id = aws_subnet.terraform_public_subnet_1.id
  route_table_id = aws_route_table.terraform_public_route_table.id
}

resource "aws_route_table_association" "terraform_public_route_association_2" {
  subnet_id = aws_subnet.terraform_public_subnet_2.id
  route_table_id = aws_route_table.terraform_public_route_table.id
}

resource "aws_route" "terraform_route-igw" {
  route_table_id = aws_route_table.terraform_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.terraform_internet_gateway.id
}
