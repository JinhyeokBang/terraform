resource "aws_db_instance" "terraform_rds" {
  allocated_storage = 20            
  max_allocated_storage = 50        
  availability_zone = "ap-northeast-2a"  
  deletion_protection = false        
  skip_final_snapshot = true        
  engine = "mysql"                 
  engine_version = "8.0.28"         
  instance_class = "db.t3.micro"   
  username = var.database_user_name
  password = var.database_password

  vpc_security_group_ids = [aws_security_group.terraform_private_security_group.id]
  db_subnet_group_name = aws_db_subnet_group.terraform_subnet_group.name

  port = 3306

  tags = {
      "name" = "${var.project_name}_rds"
  }
}
