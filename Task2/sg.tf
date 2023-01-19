resource "aws_security_group" "ssh-sg" {
  name        = "ssh-sg"
  vpc_id      = aws_vpc.myvpc.id
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH from VPC"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.my_tags
}

resource "aws_security_group" "http-sg" {
  name        = "http-sg"
  vpc_id      = aws_vpc.myvpc.id
  description = "Allow HTTP inbound traffic"
  ingress {
    description = "HTTP from VPC"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.my_tags
}
