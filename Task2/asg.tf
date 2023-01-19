resource "aws_launch_template" "my_lt" {
  name_prefix            = "my_lt"
  image_id               = "ami-1a2b3c"
  instance_type          = "t2.micro"
  key_name               = "bastion-key"
  vpc_security_group_ids = [aws_security_group.ssh-sg.id, aws_security_group.http-sg.id]
  user_data              = var.user_data
}
resource "aws_autoscaling_group" "my_asg" {
  name                      = "my_asg"
  vpc_zone_identifier       = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id, aws_subnet.public_subnet3.id]
  desired_capacity          = 2
  max_size                  = 3
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns         = [aws_lb_target_group.my_alb_tg.arn]
  launch_template {
    id      = aws_launch_template.my_lt.id
    version = "$Latest"
  }
}
