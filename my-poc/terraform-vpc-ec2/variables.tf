variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "ec2_default_root_volume_size" {
  description = "Default root volume size for EC2 instance"
  type        = number
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones for the VPC"
  type        = list(string)
}

variable "public_subnet_cidr" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "region" {
    description = "AWS region for the resources"
    type        = string
  
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}