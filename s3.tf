resource "aws_s3_bucket" "mondaycicd" {
  bucket = "mondaycicd"

  tags = {
    Name        = "mondaycicd"
    Environment = "Dev"
  }
}