resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  multi_az               = false
  storage_type           = "standard"
  username               = "dbadmin"
  password               = var.password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = var.private_subnet_id

  tags = {
    Name = "Education"
  }
}


