variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "contador-react-cicd"
}

variable "ecr_access_role_arn" {
  description = "IAM role ARN for App Runner to access ECR"
  type        = string
}

variable "image_tag" {
  description = "Image tag (ex: latest or commit SHA)"
  type        = string
  default     = "v1" 
}
