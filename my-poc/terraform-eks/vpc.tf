module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.21.0"
    
    name = "${local.name}-vpc"
    cidr = local.vpc_cidr
    
    azs             = local.availability_zones
    public_subnets  = local.public_subnet_cidr
    private_subnets = local.private_subnet_cidr
    intra_subnets = local.intranet_ip
    enable_nat_gateway = true
    
    
    tags = {
        "Name"        = "${local.name}-vpc"
        "Environment" = local.Environment
    }
  
}