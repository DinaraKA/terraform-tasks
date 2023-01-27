output "alb_dns_name" {
  value       = aws_lb.taskalb.dns_name
  description = "DNS name of ALB"
}

output "dns_record" {
  value       = aws_route53_record.web.fqdn
  description = "DNS name of ALB"
}

output "db_endpoint" {
  value       = module.task_rds.cluster_endpoint
  sensitive   = true
  description = "RDS DB password"
}

output "db_username" {
  value       = module.task_rds.cluster_master_username
  sensitive   = true
  description = "RDS DB password"
}

output "db_password" {
  value       = module.task_rds.cluster_master_password
  sensitive   = true
  description = "RDS DB password"
}
