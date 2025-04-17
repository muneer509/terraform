variable "instances" {
  type = map(any)
}
variable "ingress_from_port" {
  type    = number
  default = 0
}
variable "ingress_to_port" {
  type    = number
  default = 0
}
variable "egress_from_port" {
  type    = number
  default = 0
}
variable "egress_to_port" {
  type    = number
  default = 0
}
variable "protocol" {
  type    = string
  default = "-1"
}
variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}
variable "common_tags" {
  default = {
    Project   = "expense"
    terraform = "true"
  }
}
variable "environment" {
  type = map(any)
}