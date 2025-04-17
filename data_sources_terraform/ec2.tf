resource "aws_instance" "terraform_instance" {

    ami = data.aws_ami.joindevops.id
    count = length(var.instance_names)
    instance_type = var.instance_type
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
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = merge(
        var.common_tags,
        {
            Name = "terraform_SG"
        }
    )
}