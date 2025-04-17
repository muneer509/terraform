resource "aws_route53_record" "expense_r53" {
  for_each = aws_instance.terraform_instance
  zone_id = local.zone_id
  type    = "A"
  ttl     = 1
  name = each.key == "frontend" ? local.domain_name : "${each.key}.${local.domain_name}"

  # records = [aws_instance.terraform_instance[count.index].private_ip]
  allow_overwrite = true
  records         = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
}