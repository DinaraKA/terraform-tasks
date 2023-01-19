resource "aws_lb" "my_lb" {
  name                       = "mylb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.ssh-sg.id, aws_security_group.http-sg.id]
  subnets                    = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id, aws_subnet.public_subnet3.id]
  enable_deletion_protection = false
  tags                       = var.my_tags
}

resource "aws_lb_target_group" "my_alb_tg" {
  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
  name     = "my-alb-tg"
  port     = var.http_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_alb_tg.arn

  }
}