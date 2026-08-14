resource "aws_autoscaling_group" "lab2" {
  name = "lab2-asg"

  min_size         = 2
  max_size         = 4
  desired_capacity = 2

  vpc_zone_identifier = [
    var.public_subnet_1_id,
    var.public_subnet_2_id
  ]

  launch_template {
    id      = aws_launch_template.lab2.id
    version = "$Latest"
  }

  target_group_arns = [
    aws_lb_target_group.lab2.arn
  ]

  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "lab2-asg-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "lab2_cpu" {
  name                   = "lab2-cpu-scaling"
  autoscaling_group_name = aws_autoscaling_group.lab2.name
  policy_type             = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 70.0
  }
}