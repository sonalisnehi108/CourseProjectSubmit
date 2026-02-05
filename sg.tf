
## Creating SG

module "security-group1" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.0.0"

  name        = "bastion-sg"  ## name of the SG group
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id   ## It should be in the format of module_keyowrd.module_name.output_value

        
       ## Below ingress block is a list
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
      ]

  egress_rules = [
    "all-all"
  ] 

}




module "security-group2" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.0.0"


  name        = "private-sg"  ## name of the SG group
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id   ## It should be in the format of module_keyowrd.module_name.output_value

        
       ## Below ingress block is a list
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"    ## # -1 means all protocols
      description = "Allow all inbound from VPC"
      cidr_blocks = "10.100.0.0/16"
    }
   ]

  egress_rules = [
    "all-all"
  ] 

}



module "security-group3" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.0.0"


  name        = "public-sg"  ## name of the SG group
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id   ## It should be in the format of module_keyowrd.module_name.output_value

        
       ## Below ingress block is a list
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Allow HTTP from my IP"
      cidr_blocks = "0.0.0.0/0"
    }

   ]

  egress_rules = [
    "all-all"
  ] 

}
