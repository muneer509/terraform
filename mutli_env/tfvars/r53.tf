resource "aws_route53_record" "r53_mutli_env" {
    zone_id = local.zone_id
  for_each = aws_instance.mutlti_env_instance
  name = each.key == "frontend-dev" ? local.domain_name : "${each.key}.${local.domain_name}"
  type = "A"
  ttl = "1"
  allow_overwrite = true
    records         = startswith(each.key, "frontend") ? [each.value.public_ip] : [each.value.private_ip]
}
