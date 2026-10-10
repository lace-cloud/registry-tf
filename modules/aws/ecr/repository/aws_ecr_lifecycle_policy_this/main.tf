resource "aws_ecr_lifecycle_policy" "this" {
  count = length(var.lifecycle_rules) > 0 ? 1 : 0
  policy = jsonencode({
    rules = [
      for i, rule in var.lifecycle_rules : {
        rulePriority = i + 1
        description  = lookup(rule, "description", "Lifecycle rule ${i + 1}")
        selection = {
          tagStatus     = rule.tag_status
          tagPrefixList = lookup(rule, "tag_prefix_list", null)
          countType     = rule.count_type
          countNumber   = rule.count_number
          countUnit     = lookup(rule, "count_unit", null)
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
  repository = var.this_name
}
