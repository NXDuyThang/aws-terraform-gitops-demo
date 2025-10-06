terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "my-terraform-state-bucket-demo"
    key    = "terraform/state.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-demo-gitops-bucket-123456"
  tags = {
    Name = "GitOpsDemo"
  }
}
