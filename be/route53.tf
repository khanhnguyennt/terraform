resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.environment == "prod" ? "be.web2.babaucanbiet.com" : "be-dev.web2.babaucanbiet.com"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = false
  }
}

data "aws_route53_zone" "main" {
  name         =  "web2.babaucanbiet.com"
  private_zone = false
}