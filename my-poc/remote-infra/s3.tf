resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "rishindra-learning-tfstate-bucket"
  tags = {
    Name        = "Terraform State Bucket"
  }
  
}