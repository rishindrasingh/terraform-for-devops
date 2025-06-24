resource "aws_dynamodb_table" "myfirsttable" {
  name           = "${var.env}-infra-app-dynamodb-table" 
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hashed_key
  attribute {
    name = var.hashed_key
    type = "S"
  }
   tags = {
    Name        = "${var.env}-infra-app-dynamodb-table"
    environment = var.env # Set environment tag based on variable

  }
  
}