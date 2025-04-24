################################################################################
# Set required providers and version
################################################################################

terraform {
  backend "s3" {
    bucket = "terraform-state-storage20250424114023706500000002"
    region = "us-east-1"
    key    = "terraform.tfstate"
    # dynamodb_table = "terraform-state-storage"
    encrypt        = false
    # kms_key_id     = "alias/terraform-state-storage"

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.40.0"
    }
  }
  required_version = ">=1.4.4"
}

provider "aws" {
  region = "us-east-1"
}


################################################################################
# S3 Bucket
################################################################################

resource "aws_s3_bucket" "this" {
  bucket_prefix = "tf-play-bucket-1"
}