terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "deepan-mod3-2"
    key    = "mod1-3.2/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "workshop" {
  #checkov:skip=CKV_AWS_18
  #checkov:skip=CKV_AWS_145
  #checkov:skip=CKV_AWS_144
  #checkov:skip=CKV2_AWS_61
  #checkov:skip=CKV2_AWS_62
  bucket_prefix = "deepan-workshop-"
}

resource "aws_s3_bucket_versioning" "workshop" {
  bucket = aws_s3_bucket.workshop.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "workshop" {
  bucket = aws_s3_bucket.workshop.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}