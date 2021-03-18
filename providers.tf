provider "aws" {
  region  = var.aws_region
  profile = var.profile
  version = "~> 2.7"
}
