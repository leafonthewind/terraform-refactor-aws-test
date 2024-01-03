resource aws_s3_bucket very_specific_s3_bucket {
  bucket = "cantbelievethisnameisnottaken"
}

moved {
  from = aws_s3_bucket.s3_bucket
  to = aws_s3_bucket.very_specific_s3_bucket
}
