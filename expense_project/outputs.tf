output "instance_info" {
  value = aws_instance.terraform_instance
}
output "r53_records" {
  value = [aws_route53_record.expense_r53]
}