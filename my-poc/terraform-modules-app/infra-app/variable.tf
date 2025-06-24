variable "env" {
  type    = string
  description = "This is the environment for my infra"
}

variable "bucket_name" {
  type    = string
  description = "This is the name of the S3 bucket for my infra"
}

variable "instance_count" {
  type    = number
  description = "Number of EC2 instances to create"
}

variable "ec2_ami" {
    type    = string
    description = "AMI ID for the EC2 instance"
  
}

variable "ec2_instance_type" {
    type    = string
    description = "Instance type for the EC2 instance"
}

variable "hashed_key" {
    type    = string
    description = "Hash key for the DynamoDB table"
  
}