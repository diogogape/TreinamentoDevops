terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket         = "devops-treinamento-515338929527-sa-east-1-an"
    key            = "tf-state-setup"
    region         = "sa-east-1"
    encrypt        = true
    dynamodb_table = "devops_lock"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}
