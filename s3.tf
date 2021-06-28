resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.bucket_name}"
  acl    = "public-read"
  policy = templatefile("templates/s3-policy.json", { bucket = "www.${var.bucket_name}" })

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.domain_name}"]
    max_age_seconds = 3000
  }

  versioning {
    enabled = true
  }

  website {
    index_document = "index.html"
    # If you have an error page update this with the error page
    error_document = "index.html"
  }
}

resource "aws_s3_bucket" "root_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = templatefile("templates/s3-policy.json", { bucket = var.bucket_name })

  website {
    redirect_all_requests_to = "https://www.${var.domain_name}"
  }
}

resource "aws_s3_bucket_object" "upload_www_bucket" {
  for_each = fileset("website/", "*")
  bucket   = aws_s3_bucket.www_bucket.id
  key      = each.value
  source   = "website/${each.value}"
  etag     = filemd5("website/${each.value}")
}