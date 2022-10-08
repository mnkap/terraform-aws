module "asg" {
  source = "../modules/asg"

  env_code          = var.env_code
  vpc_id            = data.terraform_remote_state.level1.outputs.vpc_id
  private_subnet_id = data.terraform_remote_state.level1.outputs.private_subnet_id
  load_balancer_sg  = module.alb.load_balancer_sg
  target_group_arn  = module.alb.target_group_arn
}
