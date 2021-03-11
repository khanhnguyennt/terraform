# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform" {
  name = "terraform-dynamo"
  hash_key = "LockID"
   billing_mode     = "PAY_PER_REQUEST"
   
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}