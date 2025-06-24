resource "aws_dynamodb_table" "myfirsttable" {
  name           = "rishindra-learning-dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
   tags = {
    Name        = "Terraform-DynamoDB-Table-1"

  }
  
}