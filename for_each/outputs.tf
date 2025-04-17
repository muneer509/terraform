output "instance_details" {
  value = aws_instance.terraform_instance
}
# #  output "r53_records" {
# #    value = {aws_route53_record.expense_r53[*].name}
# # }
output "zone_id" {
  value = local.zone_id
}
output "domain_name" {
  value = local.domain_name
}
output "r53_records" {
  value = {
    for key, r53_records in aws_route53_record.expense_r53 :
    key =>r53_records.name
      }
}