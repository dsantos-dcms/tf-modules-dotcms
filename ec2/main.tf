# Minimum EC2 configuration for DOTCMS
resource "aws_instance" "main" {
  ami = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  key_name = var.key_name
  iam_instance_profile = var.allow_ssm ? aws_iam_instance_profile.ec2_instance_profile[0].id : null

  root_block_device {
    volume_size = "50"
    volume_type = "gp2"
  }

  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
}

  user_data =   <<-EOF
                [[[#!/bin/bash
                sudo yum update -y
                EOF
  tags = {
    Name = var.name
  }
}

# EC2 NIC
resource "aws_network_interface" "nic" {
  subnet_id       = var.subnet_id
  private_ips     = var.private_ips
  security_groups = [aws_security_group.sg.id]
}

# PUBLIC IP
resource "aws_eip" "app_eip" {
  vpc                       = true
  instance                  = aws_instance.main.id
  associate_with_private_ip = var.private_ip
  depends_on = [
    aws_instance.main
  ]
}

# EC2 SG
resource "aws_security_group" "sg" {
  name        = "ssh_ingress_security_group"
  description = "Allow SSH access from anywhere"
  vpc_id      = var.vpc_id

  # Allow SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

