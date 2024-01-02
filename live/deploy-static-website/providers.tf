# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-backend-projects-work"
    key            = "modules/data-storages/s3/public-bucket"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}
