resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = merge(
    var.all_tags,
    {
      Name = "TaskVPC"
    },
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = merge(
    var.all_tags,
    {
      Name = "TaskIG"
    },
  )
}

resource "aws_route" "rt" {
  route_table_id         = aws_vpc.my_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = merge(
    var.all_tags,
    {
      Name = "Subnet1"
    },
  )
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = merge(
    var.all_tags,
    {
      Name = "Subnet2"
    },
  )
}

resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = merge(
    var.all_tags,
    {
      Name = "Subnet3"
    },
  )
}