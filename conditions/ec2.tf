resource "aws_instance" "terraform_instance" {

    ami = var.ami_id
    instance_type = var.Environment == "Prod" ? "t3.small" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
        Name = "Terraform-instance" ,
       
}
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

    tags = {
        Name = "allow_ssh_23_terraform"
    }
}
