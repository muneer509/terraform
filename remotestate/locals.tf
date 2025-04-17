locals {
  domain_name = "mdevpos.online"
  zone_id = "Z02542641NKWMWXM4G9FV"
  instance_type = var.instance_names == "mysql" ? "t3.small" : "t3.micro"
  # count will not work in locals
  # instance_type          = var.instance_names[count.index] == var.instance_names[0] ? var.instance_for_mysql : var.insrance_for_forntend-backend 

}