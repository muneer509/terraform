output "public_ip" {
  value = aws_instance.terraform_instance.public_ip

}
output "private_ip" {
  value = aws_instance.terraform_instance.private_ip
}
output "Public-DNS-details" {
  value = aws_instance.terraform_instance.public_dns
}
output "instance_ID" {
  value = aws_instance.terraform_instance.id
}