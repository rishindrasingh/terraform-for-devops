variable "ec2_instance_type" { 
  type    = string
  default = "t2.micro"

}

variable "ec2_ami" {
  type    = string
  default = "ami-020cba7c55df1f615" # ubuntu 22.04 LTS
}

variable "ec2_default_root_volume_size" {
  type    = number
  default = 8
}

variable "env" {
  type    = string
  default = "prod"  
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
  
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
  
}

variable "vpc_cidr" {
  type    = string
  default =  "10.0.0.0/16"
  
}