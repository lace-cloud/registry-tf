module "iam_role" {
  source             = "git::https://github.com/lace-cloud/registry-tf.git//aws/iam/role?ref=v1.0.0"
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
  tags               = var.tags
}

module "cloudwatch_logs_policy" {
  source      = "./policies/cloudwatch_logs"
  role_name   = module.iam_role.role_name
  policy_name = "cloudwatch-logs"
  actions     = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
  resources   = ["*"]
}
