variable "region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Short project name, used in resource names"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]{3,20}$", var.project))
    error_message = "project must be 3-20 chars: lowercase letters, digits, hyphens."
  }
}

variable "environment" {
  description = "dev, test or prod"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be one of: dev, test, prod."
  }
}

variable "extra_tags" {
  description = "Additional tags merged onto every resource"
  type        = map(string)
  default     = {}
}
