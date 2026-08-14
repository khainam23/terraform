resource "aws_lb_target_group" "lab2" {
  name     = "lab2-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.lab2_vpc_id

  health_check {
    path = "/"
  }
}