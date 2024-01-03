moved {
  from = aws_s3_bucket.very_specific_s3_bucket
  to = aws_s3_bucket.all_my_s3_buckets["very_specific_s3_bucket"]
}

moved {
  from = aws_s3_bucket.another_s3_bucket
  to = aws_s3_bucket.all_my_s3_buckets["another_s3_bucket"]
}

variable lots_of_buckets {
  type = map(string)
  default = {
    "very_specific_s3_bucket": "cantbelievethisnameisnottaken",
    "another_s3_bucket": "cantbelievethisnameisnottaken100"
  }
}

resource aws_s3_bucket all_my_s3_buckets {
  for_each = var.lots_of_buckets
  bucket   = each.value
}
