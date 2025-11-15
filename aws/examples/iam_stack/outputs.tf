output "role_name" {
  value = module.iam_role.role_name
}

output "role_arn" {
  value = module.iam_role.role_arn
}

output "policy_arn" {
  value = module.cloudwatch_logs_policy.policy_arn
}
