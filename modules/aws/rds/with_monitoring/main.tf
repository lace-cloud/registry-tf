module "subnet_group" {
  source = "../subnet_group"

  name        = "${var.identifier}-subnet-group"
  description = "Subnet group for ${var.identifier}"
  subnet_ids  = var.subnet_ids
  tags        = var.tags
}

module "db" {
  source = "../instance"

  identifier              = var.identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  db_subnet_group_name    = module.subnet_group.subnet_group_name
  vpc_security_group_ids  = var.vpc_security_group_ids
  multi_az                = var.multi_az
  deletion_protection     = var.deletion_protection
  backup_retention_period = var.backup_retention_period
  storage_encrypted       = true
  tags                    = var.tags

  depends_on = [module.subnet_group]
}

module "cpu_alarm" {
  source = "../../cloudwatch/metric_alarm"

  alarm_name          = "${var.identifier}-high-cpu"
  alarm_description   = "CPU utilization above ${var.cpu_alarm_threshold}% for ${var.identifier}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = var.cpu_alarm_threshold
  dimensions          = { DBInstanceIdentifier = module.db.db_instance_id }
  alarm_actions       = var.alarm_actions
  ok_actions          = var.alarm_actions
  tags                = var.tags
}

module "storage_alarm" {
  source = "../../cloudwatch/metric_alarm"

  alarm_name          = "${var.identifier}-low-storage"
  alarm_description   = "Free storage below ${var.storage_alarm_threshold_gb}GB for ${var.identifier}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = var.storage_alarm_threshold_gb * 1024 * 1024 * 1024
  dimensions          = { DBInstanceIdentifier = module.db.db_instance_id }
  alarm_actions       = var.alarm_actions
  ok_actions          = var.alarm_actions
  tags                = var.tags
}
