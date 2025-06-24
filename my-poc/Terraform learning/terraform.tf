terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }

  backend "s3" {
    bucket         = "rishindra-learning-tfstate-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "rishindra-learning-dynamodb-table"
  }
}