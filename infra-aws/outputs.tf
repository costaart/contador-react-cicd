output "repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.app_repository.repository_url
}

output "service_url" {
  description = "URL pública do App Runner"
  value       = aws_apprunner_service.contador.service_url
}
