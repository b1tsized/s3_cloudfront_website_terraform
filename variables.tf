variable "region" {
  description = "Region in which you want all the AWS Infrastructure hosted."
}

variable "domain_name" {
  description = "Route53 Hosted Domain you want to use. If you already have it change it from resource to data inside the block."
  type        = string
}

variable "bucket_name" {
  description = "Name for the bucket you want to use for your website. Normally would match the domain_name."
  type        = string
}

/* Uncomment if you need to use these variables.
variable "my_aws_access_key" {
  description = "Your AWS access key to allow you to connect via API to AWS"
}

variable "my_aws_secret_key" {
  description = "Your AWS access key to allow you to connect via API to AWS"
}
*/