provider "aws" {
  region = "us-east-1"
}

terraform {
  # Utilizing Terraform Cloud as our backend provider
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "vroom"

    workspaces {
      prefix = "account-core-"
    }
  }
}