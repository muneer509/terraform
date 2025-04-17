# resource "aws_route53_record" "expense_r53" {
#   count = length(var.instance_names)
#   zone_id = var.zone_id
#   type = "A"
#   ttl = 1
#   name = "${var.instance_names[count.index]}.${var.domain_name}"
    
#   records = [aws_instance.terraform_instance[count.index].private_ip]


# }