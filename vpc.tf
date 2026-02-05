## Terraform module code

## Whenever we need output of one particular resource as an input to other resource.
## This is the format --> resource_type.resource_name.output_value

## In registry.terraform web page. There is a code for every resource. We copy paste the code from there.
## For every resource, there are fcrentain things mentioned in that page
## Arguement reference  --> This is the inputs that we can pass
## Attribute Reference  --> it is the output that you can use in below format --> resource_type.resource_name.output_valu

## In case of Modulesthe format of passing the output parameter will be: module.module_name.output_value
## Output value will be coming from Module documentation registry.terraform


## Activity:
## Let's create VPC, SG, EC2

## Creating VPC

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"


  name = "courseproject-newvpc"
  cidr = "10.100.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.100.1.0/24", "10.100.2.0/24"]
  public_subnets  = ["10.100.3.0/24", "10.100.4.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false  ## We don't need VPN gateway
  single_nat_gateway = true

  
    # Allow outbound to 0.0.0.0/0
  public_subnet_tags = {
    Name = "public-subnet"
  }

  private_subnet_tags = {
    Name = "private-subnet"
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
