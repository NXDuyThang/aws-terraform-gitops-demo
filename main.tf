terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

   Tạm thời tắt backend nếu chưa có S3 state bucket
   backend "s3" {
     bucket = "my-terraform-state-bucket-demo"
     key    = "terraform/state.tfstate"
     region = "ap-southeast-1"
   }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-demo-gitops-bucket-${random_id.suffix.hex}"
  tags = {
    Name = "GitOpsDemo"
  }
}

