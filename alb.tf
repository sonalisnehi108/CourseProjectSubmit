module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "5.0.0"

  name               = "mcourse-alb"
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id          # replace with your VPC ID
  subnets            = module.vpc.public_subnets  # replace with your public subnets

  security_groups    = [module.security-group3.security_group_id]         # attach SG allowing inbound HTTP/HTTPS

  # Listener for HTTP
  http_tcp_listeners = [
    {
      port     = 80
      protocol = "HTTP"
      action_type = "forward"
      target_group_index = 0
    }
  ]

  # Target group for EC2 instances
  target_groups = [
    {
      name_prefix      = "tg-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        path                = "/"
        protocol            = "HTTP"
        matcher             = "200"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 3
        unhealthy_threshold = 3
      }
    }
  ]
}