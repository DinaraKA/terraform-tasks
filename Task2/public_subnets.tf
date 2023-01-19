resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.cidr_block1
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags                    = var.my_tags
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.cidr_block2
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"
  tags                    = var.my_tags
}

resource "aws_subnet" "public_subnet3" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.cidr_block3
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"
  tags                    = var.my_tags
}

