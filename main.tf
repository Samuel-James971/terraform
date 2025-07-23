provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-secure-bucket-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name        = "MySecureBucket"
    Environment = "Dev"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
