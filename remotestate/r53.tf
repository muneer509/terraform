resource "aws_route53_record" "expense_r53" {
  count   = length(var.instance_names)
  zone_id = local.domain_name
  type    = "A"
  ttl     = 1
  name = var.instance_names[count.index] == var.instance_names[2] ? local.domain_name : "${var.instance_names[count.index]}.${local.domain_name}"

  # records = [aws_instance.terraform_instance[count.index].private_ip]
  allow_overwrite = true
  records         = var.instance_names[count.index] == var.instance_names[2] ? [aws_instance.terraform_instance[count.index].public_ip] : [aws_instance.terraform_instance[count.index].private_ip]

}