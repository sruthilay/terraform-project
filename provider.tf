provider "aws" {
  region = var.region

}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.1.0"
    }
  }
  required_version = ">= 0.14.9"
}
