resource "aws_launch_template" "capstone_template" {
  name = "capstone_project3_template"
  image_id = "ami-005f9685cb30f234b"
  instance_type = "t2.micro"
  network_interfaces {
     security_groups = [aws_security_group.capstone_sg.id]
 }
}

resource "aws_autoscaling_group" "capstone_asg" {
  name = "capstone_project3_asg"
  max_size = 2
  min_size = 1
  health_check_type = "EC2"
  desired_capacity = 1
  vpc_zone_identifier = [aws_subnet.capstone_subnet_a.id, aws_subnet.capstone_subnet_b.id, aws_subnet.capstone_subnet_c.id]
  launch_template {
     id = aws_launch_template.capstone_template.id
  }
}

resource "aws_autoscaling_policy" "capstone_autoscaling_policy" {
  name = "capstone_project3_autoscaling_policy"
  policy_type = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.capstone_asg.name
  estimated_instance_warmup = 200
  target_tracking_configuration {
     predefined_metric_specification {
     	predefined_metric_type = "ASGAverageCPUUtilization"
     }
     target_value = "20"
  }
}
