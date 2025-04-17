# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "5.66.0"
#     }
#   }
# }

# provider "aws" {
#   # Configuration options
#   region = "us-east-1"
# }

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}