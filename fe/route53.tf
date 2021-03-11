resource "aws_route53_record" "www" {
  zone_id = "Z0028075OWM09ESC7L7D"
  name    = var.environment == "prod" ? "web2.babaucanbiet.com" : "dev.web2.babaucanbiet.com"
  type    = "A"
   alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}