terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region

  # Uncomment if you need to use the access and secret keys.
  # access_key = var.my_aws_access_key
  # secret_key = var.my_aws_secret_key

}

# This is for ACM, which is only available in us-east-1
provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}