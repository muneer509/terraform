resource "aws_instance" "mutlti_env_instance" {
  ami                    = data.aws_ami.joindevops.id
  for_each               = var.instances
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.mutli_env_sg.id]
  tags = merge(
    var.common_tags,
    var.environment,
    {
      Name = each.key
    }

  )
}
resource "aws_security_group" "mutli_env_sg" {
  name = " allow-ssh"
  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks

  }
  egress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks

  }
  tags = merge(
    var.common_tags,
    var.environment,

    {
      Name = "allow-ssh-mutlt-env"
    }
  )
}