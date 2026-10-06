terraform {
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
  bucket_prefix = "deepan-workshop-"
}