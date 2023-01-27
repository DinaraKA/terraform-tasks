resource "random_password" "db_password" {
  length           = 10
  special          = true
  override_special = "!@&"
}

module "task_rds" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "7.6.0"

  name            = "task-rds"
  engine          = "aurora-mysql"
  instance_class  = "db.t3.small"
  master_username = "admin"
  master_password = random_password.db_password.result
  database_name   = "wordpress"
  instances = {
    1 = {
      instance_class = "db.t3.small"
    }
    2 = {
      instance_class = "db.t3.small"
    }
  }

  vpc_id  = aws_vpc.my_vpc.id
  subnets = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]

  allowed_cidr_blocks = ["0.0.0.0/0"]

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10
  skip_final_snapshot = true

  tags = merge(var.all_tags, {
    Name = "Task-RDS"
  })
}

