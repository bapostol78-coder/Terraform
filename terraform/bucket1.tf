resource "aws_s3_bucket" "first" {
  bucket_prefix = "tf-lab01-"
  force_destroy = true

   tags = {
    Name = "My first Terraform bucket"
  }
}

# resource "aws_s3_bucket_versioning" "first" {
#  bucket = aws_s3_bucket.first.id
  
#  versioning_configuration {
#  status = "Enabled"
#  }
#}  
  
  
