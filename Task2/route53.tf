resource "aws_route53_record" "cname_route53_record" {
  zone_id = "Z062163729KI19BNKV2M1"
  name    = "alb.dinaraka.com"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.my_lb.dns_name]
}
