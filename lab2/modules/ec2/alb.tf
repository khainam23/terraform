resource "aws_lb" "lab2_alb" {
  name               = "lab2-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    var.lab2_public_sg_id
  ]

  subnets = [
    var.public_subnet_1_id,
    var.public_subnet_2_id
  ]
}

resource "aws_lb_listener" "lab2" {
  load_balancer_arn = aws_lb.lab2_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lab2.arn
  }
}