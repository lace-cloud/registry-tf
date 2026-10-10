module "aws_ecs_cluster_capacity_providers_this" {
  source                             = "./aws_ecs_cluster_capacity_providers_this"
  capacity_providers                 = var.capacity_providers
  default_capacity_provider_strategy = var.default_capacity_provider_strategy
  this_name                          = module.aws_ecs_cluster_this.this_name
}
module "aws_ecs_cluster_this" {
  source                                      = "./aws_ecs_cluster_this"
  container_insights____enabled_____disabled_ = var.container_insights ? "enabled" : "disabled"
  name                                        = var.name
  tags                                        = var.tags
}
moved {
  from = aws_ecs_cluster.this
  to   = module.aws_ecs_cluster_this.aws_ecs_cluster.this
}
moved {
  from = aws_ecs_cluster_capacity_providers.this
  to   = module.aws_ecs_cluster_capacity_providers_this.aws_ecs_cluster_capacity_providers.this
}
