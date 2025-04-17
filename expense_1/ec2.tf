resource "aws_instance" "terraform_instance" {

  ami                    = data.aws_ami.joindevops.id
  count                  = length(var.instance_names)
  instance_type          = var.instance_names[count.index] == var.instance_names[0] ? var.instance_for_mysql : var.insrance_for_forntend-backend 
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }

  )
}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = var.sg_name
  description = "Allow port number 22 for SSH access"

  # usually we allow everything in egress
  egress {
    from_port   = var.egress_fronmandto_portto_port
    to_port     = var.egress_fronmandto_portto_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
    # ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port   = var.ingress_fromandto_portfrom_port
    to_port     = var.egress_fronmandto_portto_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "terraform_SG"
    }
  )
}