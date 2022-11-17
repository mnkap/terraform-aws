module "rds" {
  source            = "../modules/rds"
  vpc_id            = data.terraform_remote_state.level1.outputs.vpc_id
  private_subnet_id = data.terraform_remote_state.level1.outputs.private_subnet_id
  username = var.username
  db_name = var.db_name
  instance_class = var.instance_class 

}

