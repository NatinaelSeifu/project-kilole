terraform {
  

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.20.0"
    }
  }
   backend "s3" {

    bucket         = "terraform-state-key20231117084134961500000001"
    key            = "Project-Kilole/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true

  }
}

provider "aws" {

       }

resource "aws_s3_bucket" "myterr-s3-bucket-00" {
bucket = var.bucket_name

  tags = {
    name = var.bucket_tag
  }
}

