terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 🔥 ECR repository
resource "aws_ecr_repository" "app_repository" {
  name                 = var.ecr_repository_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# 🔥 App Runner service
resource "aws_apprunner_service" "contador" {
  service_name = "contador-react-app"

  source_configuration {
    authentication_configuration {
      access_role_arn = var.ecr_access_role_arn
    }

    image_repository {
      image_identifier      = "${aws_ecr_repository.app_repository.repository_url}:${var.image_tag}"
      image_repository_type = "ECR"
      image_configuration {
        port = "80"
      }
    }

    auto_deployments_enabled = true
  }

  instance_configuration {
    cpu    = "1024" # 1 vCPU
    memory = "2048" # 2 GB
  }

  health_check_configuration {
    protocol            = "TCP"
    path                = null
    interval            = 5  # segundos
    timeout             = 2  # segundos
    healthy_threshold   = 1
    unhealthy_threshold = 2
  }
}
