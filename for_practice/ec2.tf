resource "aws_instance" "terraform_instance" {
    count = var.number_of_servers
    ami = data.aws_ami.joindevops.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = merge(
        var.common_tags,
        {
            Name = "For_practice_terraform"
        }
    )
}

resource "aws_security_group" "allow_ssh_terraform" {
    name        = var.sg_name
    description = "Allow port number 22 for SSH access"

    # usually we allow everything in egress
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        
    }

    ingress {
        from_port        = var.ingress_fromandto_port
        to_port          = var.ingress_fromandto_port
        protocol         = var.protocol
        cidr_blocks      = var.cidr_blocks
        
    }

    tags = {
        Name = "allow_ssh_terraform"
    }
}