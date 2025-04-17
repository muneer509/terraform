

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "common_tags" {
  type = map(any) #optional
  default = {

    Project = "expense"

    Environment = "DEV"
    Terraform   = "true"
  }
}

variable "sg_name" {
  default = "allow_sshh"
}

variable "sg_description" {
  default = "Allow port number 22 for SSH access"
}

variable "ingress_fromandto_portfrom_port" {
  default = 22
  type    = number
}

variable "egress_fronmandto_portto_port" {
  default = 22
  type    = number
}

variable "protocol" {
  default = "tcp"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "instance_names" {
type = map
default = {
  frontend = "t3.micro"
  backend = "t3.micro"
  mysql = "t3.small"
}
}
