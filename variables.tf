variable "AWS_ACCESS_KEY" {
  description = "AWS User access key.  Has access to S3 to create, delete buckets."
  type = string
  sensitive = true
}

variable "AWS_SECRET_KEY" {
  description = "AWS User secret key.  Has access to S3 to create, delete buckets."
  type = string
  sensitive = true
}
