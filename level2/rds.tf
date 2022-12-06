module "rds" {
  source                 = "terraform-aws-modules/rds/aws"
  identifier             = "mydb"
  db_name                 = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7.33"
  major_engine_version   =  "5.7"
  parameter_group_name   = "default-mysql57"
  multi_az               = false
  instance_class         = "db.t3.micro"
  storage_type           = "standard"
  family                 = "mysql5.7"
  skip_final_snapshot    = true
  allocated_storage      = 10
  create_db_subnet_group = false
  create_random_password = false
  username               = "dbadmin"
  password               = local.rdspassword
  subnet_ids            = [data.terraform_remote_state.level1.outputs.private_subnets[0], data.terraform_remote_state.level1.outputs.private_subnets[1]]
  vpc_security_group_ids = ["sg-01eb067e815a70acf"]
}
