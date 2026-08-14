data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_template" "lab2" {
  name_prefix   = "lab2-launch-template-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  iam_instance_profile {
    name = var.lab2_instance_profile_name
  }

  vpc_security_group_ids = [
    var.lab2_public_sg_id
  ]

  user_data = base64encode(<<-EOF
    #!/bin/bash

    apt-get update -y
    apt-get install -y nginx stress

    systemctl enable nginx
    systemctl start nginx

    echo "Hello from $(hostname)" > /var/www/html/index.html
  EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "lab2-asg-instance"
      Environment = "Lab2"
    }
  }
}