resource "aws_secretsmanager_secret_version" "this" {
  count         = var.secret_string____null___1___0
  secret_id     = var.this_id
  secret_string = var.secret_string
  lifecycle {
    ignore_changes = [secret_string]
  }
}
