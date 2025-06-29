locals {
  name = "aws-learing"
  vpc_cidr = "10.0.0.0/16"
  azs = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  intranet_ip = ["10.0.5.0/24", "10.0.6.0/24"]
  Environment = "dev"
}