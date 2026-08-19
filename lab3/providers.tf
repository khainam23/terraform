terraform {
  required_version = ">= 1.9.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.57.1"
    }
  }
}

provider "aws" {
  region = var.aws_region
  # Test nên tạm thời để key ở đây
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}