# If you already have a Route53 Zone change 'resource' to 'data' and you'll need to update any reference to data.aws_route53_zone.main
resource "aws_route53_zone" "main" {
  name = var.domain_name
}

# If you are using `data` rather than `resource` update `zone_id` to have data. in the front
resource "aws_route53_record" "root-a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.root_s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.root_s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# If you are using `data` rather than `resource` update `zone_id` to have data. in the front
resource "aws_route53_record" "www-a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.www_s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.www_s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}