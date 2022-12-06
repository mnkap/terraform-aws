module "alb" {
  source          = "terraform-aws-modules/alb/aws"
  version         = "8.2.1"
  name            = "awslb"
  security_groups    = [aws_security_group.load_balancer.id]
  vpc_id          = data.terraform_remote_state.level1.outputs.vpc_id
  subnets         = [data.terraform_remote_state.level1.outputs.public_subnets[0], data.terraform_remote_state.level1.outputs.public_subnets[1]]
  
  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      vpc_id          = data.terraform_remote_state.level1.outputs.vpc_id
    } 
  ]

   https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = aws_acm_certificate.main.arn
      target_group_index = 0
      target_group_arn = ["arn:aws:elasticloadbalancing:us-east-1:182678615463:targetgroup/pref-20221206122837818600000005/dd9ed454b3b4e7c0"]
    }
  ]
}

resource "aws_security_group" "load_balancer" {
  name        = "${var.env_code}-load-balancer"
  description = "Allow port 80 TCP inbound to ELB"
  vpc_id      = data.terraform_remote_state.level1.outputs.vpc_id

  ingress {
    description = "HTTP from public"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    description = "HTTP from public"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "ALL"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_code}-load_balancer"
  }
}

