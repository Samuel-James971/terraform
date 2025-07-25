# Configure the AWS provider to use the eu-north-1 region
provider "aws" {
  region = "eu-north-1"
}

# Create an S3 bucket with a specific name and private access
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-secure-bucket-example"  # Name of the S3 bucket
  acl    = "private"                   # Restrict access to the bucket

  # Add tags to the bucket for identification and environment tracking
  tags = {
    Name        = "MySecureBucket"
    Environment = "Dev"
  }
}

# Enable server-side encryption (SSE) for the S3 bucket using AES256
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.my_bucket.id  # Reference the bucket created above

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"  # Use AES256 for encryption
    }
  }
}
