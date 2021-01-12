## Variables set at the workspace level
variable "app_name" {}
variable "environment" {}
variable "aws_region" {}

## Create some locals based on our defined variables
locals {
  # Needs to be a local since a value in the map is another variable
  tags = {
    Environment = var.environment
    Provisioner = "terraform@:github.com/majoras-masque/account-core"
  }
}