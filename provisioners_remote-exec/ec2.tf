resource "aws_instance" "terraform_instance" {

    ami = data.aws_ami.joindevops.id
    count = 1
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = merge(
        var.common_tags,
        {
            Name = "provisioners"
        }
    )

    provisioner "local-exec" {
      command = "echo server IP address: ${self.public_ip} >> server_IP.txt"
    }
    # Here linux is remote server so will use remote-exec
    provisioner "remote-exec" {
        connection {
          type = "ssh"
          user = "ec2-user"
          password = "DevOps321"
          host = self.public_ip
        }
        inline = [ 
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
         ]
        
    }
}

resource "aws_security_group" "allow_ssh_terraform" {
    name        = var.sg_name
    description = "Allow port number 22 for SSH access"

    # usually we allow everything in egress
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = var.protocol
        cidr_blocks      = var.cidr_blocks
    }

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = var.protocol
        cidr_blocks      = var.cidr_blocks
    }

    tags = merge(
        var.common_tags,
        {
            Name = "terraform_SG"
        }
    )
}