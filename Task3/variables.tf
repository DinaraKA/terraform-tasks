variable "domain_name" {
  type        = string
  default     = "dinaraka.com"
  description = "Name of DNS Zone"
}

variable "all_tags" {
  type = map(any)
  default = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Dinara Karybekova"

  }
  description = "Resourse tags"
}