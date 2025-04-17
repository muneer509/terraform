<<<<<<< HEAD
resource "r53" "expense_r53" {
  count = length(var.instance_names)
  zone_id = var.zone_ID
  type = "A"
  ttl = 1
  name = "${var.instance_names[count.index]}.${var.domain_name}"
  record = [output.instance_info[count.index].private_ip]
=======
resource "aws_route53_record" "expense_r53" {
  count = length(var.instance_names)
  zone_id = var.zone_id
  type = "A"
  ttl = 1
  name = "${var.instance_names[count.index]}.${var.domain_name}"
    
  records = [aws_instance.terraform_instance[count.index].private_ip]

>>>>>>> 2d028e2ba53016ce766f436b6b996aa2f4c6fe87

}
