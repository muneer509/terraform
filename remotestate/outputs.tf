output "instance_ips" {
  value = [aws_instance.terraform_instance[*].public_ip]
}
output "r53_records" {
  value = [aws_route53_record.expense_r53[*].name]
}
output "zone_id" {
  value = local.zone_id
}
output "domain_name" {
  value = local.domain_name
}
