terraform {
  required_version = ">= 1.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

locals {
  name_prefix = "${var.project}-${var.environment}"
  is_prod     = var.environment == "prod"

  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "terraform"
    },
    var.extra_tags
  )
}

provider "aws" {
  region = var.region

  # Every taggable resource created by this provider gets these tags.
  default_tags {
    tags = local.common_tags
  }
}

resource "aws_s3_bucket" "data" {
  bucket_prefix = "${local.name_prefix}-data-"
  force_destroy = !local.is_prod
}

# Conditional resource: only exists in prod.
resource "aws_s3_bucket_versioning" "data" {
  count  = local.is_prod ? 1 : 0
  bucket = aws_s3_bucket.data.id

  versioning_configuration {
    status = "Enabled"
  }
}
