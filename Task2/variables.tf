variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block"
}

variable "cidr_block1" {
  type        = string
  default     = "10.0.101.0/24"
  description = "CIDR block for subnet1"
}

variable "cidr_block2" {
  type        = string
  default     = "10.0.102.0/24"
  description = "CIDR block for subnet2"
}

variable "cidr_block3" {
  type        = string
  default     = "10.0.103.0/24"
  description = "CIDR block for subnet3"
}

variable "my_tags" {
  type = map(any)
  default = {
    "Project"     = "VPC_Task",
    "Environment" = "Test",
    "Team"        = "DevOps",
    "Created_by"  = "Dinara_Karybekova"
  }
  description = "Tags"
}

variable "key_name" {
  type        = string
  default     = "bastion-key"
  description = "Key Pair Name"
}

variable "ssh_port" {
  type        = number
  default     = 22
  description = "SSH Port"
}

variable "http_port" {
  type        = number
  default     = 80
  description = "HTTP Port"
}

variable "instance_size" {
  type        = string
  default     = "t2.micro"
  description = "EC2 Instance Type"
}

variable "ami_name" {
  type        = string
  default     = "ami-0b5eea76982371e91"
  description = "EC2 AMI Name"
}

variable "ingress_cidr" {
  type        = list(any)
  default     = ["0.0.0.0/0"]
  description = "Ingress SG CIDR"
}

variable "user_data" {
  default = <<EOF
    #!/bin/bash 
    yum install httpd -y 
    service httpd start 
    chkconfig httpd on 
    echo "Hello, world" > /var/www/html/index.html
    EOF
}