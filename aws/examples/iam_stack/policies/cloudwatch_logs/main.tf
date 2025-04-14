module "policy" {
  source      = "git::https://github.com/lace-cloud/registry-tf.git//aws/iam/policy?ref=v1.0.0"
  policy_name = var.policy_name
  policy_document = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = var.actions,
      Resource = var.resources
    }]
  })
}

module "attachment" {
  source     = "git::https://github.com/lace-cloud/registry-tf.git//aws/iam/policy_attachment?ref=v1.0.0"
  role_name  = var.role_name
  policy_arn = module.policy.policy_arn
}
