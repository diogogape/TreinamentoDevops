terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket               = "devops-treinamento-515338929527-sa-east-1-an"
    key                  = "tf-state-setup"
    workspace_key_prefix = "tf-state-deploy-env"
    region               = "sa-east-1"
    encrypt              = true
    dynamodb_table       = "devops_lock"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/deploy"
    }
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
}

data "aws_region" "current" {}
