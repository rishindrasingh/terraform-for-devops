module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnet_cidr
  private_subnets = var.private_subnet_cidr

  enable_nat_gateway = true

  tags = {
    Name        = var.vpc_name
    Environment = var.env
    terraform = "true"
  }
  
}