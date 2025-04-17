output "instance_ips" {
  value = [aws_instance.terraform_instance[*].public_ip]
}
output "r53_records" {
  value = [aws_route53_record.expense_r53[*].name]
}
