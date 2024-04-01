variable "project_name" {
  type = string
  default = "my"
}

variable "ec2_ami" {
  type = string
  default = "ami-09a7535106fbd42d5"
}

variable "database_user_name" {
  type = string
  default = "user"
}

variable "database_password" {
  type = string
  default = "password"
}
