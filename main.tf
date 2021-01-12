module "aws_core" {
  # Source and Version
  source = "app.terraform.io/vroom/account-core/aws"
  version = "~>0.1.0"

  # General and Meta
  project_name     = "vroom"
  environment_name = "sandbox"
  //environment_name = var.environment TODO: Can flip back to this IRL, demoing in sandbox right now
  tags             = local.tags

  # Network
  single_nat_gateway = var.environment == "prod" ? false : true

  # Logging
  vpc_flow_log_retention_in_days = var.environment == "prod" ? 14 : 1

  # ECS - Fargate
  ecs_cluster_name              = var.environment
  ecs_default_capacity_provider = var.environment == "prod" ? "FARGATE" : "FARGATE_SPOT"
  ecs_enable_container_insights = var.environment == "prod" ? true : false
}