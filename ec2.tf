

## Creating EC2


module "ec2_instance1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name = "bastion108"

  instance_type          = "t3.micro"
  key_name               = module.key_pair.key_pair_name
  monitoring             = true
  associate_public_ip_address = true
  vpc_security_group_ids = [module.security-group1.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}




module "ec2_instance2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name = "jenkins108"

  instance_type          = "t3.micro"
  key_name               = module.key_pair.key_pair_name
  monitoring             = true
  associate_public_ip_address = true
  vpc_security_group_ids = [module.security-group3.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}



module "ec2_instance3" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name = "app108"

  instance_type          = "t3.micro"
  key_name               = module.key_pair.key_pair_name
  monitoring             = true
  associate_public_ip_address = true
  vpc_security_group_ids = [module.security-group2.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}







