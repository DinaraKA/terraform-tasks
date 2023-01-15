resource "aws_instance" "myinstance1" {
  ami                         = var.ami_name
  instance_type               = var.instance_size
  subnet_id                   = aws_subnet.public_subnet1.id
  vpc_security_group_ids      = [aws_security_group.ssh-sg.id, aws_security_group.http-sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data                   = var.user_data
  tags                        = var.my_tags

}

resource "aws_instance" "myinstance2" {
  ami                         = var.ami_name
  instance_type               = var.instance_size
  subnet_id                   = aws_subnet.public_subnet2.id
  vpc_security_group_ids      = [aws_security_group.ssh-sg.id, aws_security_group.http-sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data                   = var.user_data
  tags                        = var.my_tags
}

resource "aws_instance" "myinstance3" {
  ami                         = var.ami_name
  instance_type               = var.instance_size
  subnet_id                   = aws_subnet.public_subnet3.id
  vpc_security_group_ids      = [aws_security_group.ssh-sg.id, aws_security_group.http-sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data                   = var.user_data
  tags                        = var.my_tags
}

resource "aws_lb_target_group_attachment" "my-tg-attachment1" {
  target_group_arn = aws_lb_target_group.my-alb-tg.arn
  target_id        = aws_instance.myinstance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "my-tg-attachment2" {
  target_group_arn = aws_lb_target_group.my-alb-tg.arn
  target_id        = aws_instance.myinstance2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "my-tg-attachment3" {
  target_group_arn = aws_lb_target_group.my-alb-tg.arn
  target_id        = aws_instance.myinstance3.id
  port             = 80
}