module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "infra230893-app-bucket"
  instance_count = 1
  ec2_ami = "ami-020cba7c55df1f615" # ubuntu 22.04 LTS
  ec2_instance_type = "t2.micro"
  hashed_key = "studentId"
    
}

module "prod-infra" {
  source = "./infra-app"
  env = "prod"
  bucket_name = "infra230893-app-bucket"
  instance_count = 1
  ec2_ami = "ami-020cba7c55df1f615" # ubuntu 22.04 LTS
  ec2_instance_type = "t2.micro"
  hashed_key = "studentId"
    
}

module "stg-infra" {
  source = "./infra-app"
  env = "stg"
  bucket_name = "infra230893-app-bucket"
  instance_count = 1
  ec2_ami = "ami-020cba7c55df1f615" # ubuntu 22.04 LTS
  ec2_instance_type = "t2.micro"
  hashed_key = "studentId"
    
}