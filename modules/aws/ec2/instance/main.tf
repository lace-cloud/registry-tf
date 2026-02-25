resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = var.security_group_ids
  iam_instance_profile        = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  user_data                   = var.user_data != "" ? var.user_data : null
  user_data_base64            = var.user_data_base64 != "" ? var.user_data_base64 : null
  ebs_optimized               = var.ebs_optimized
  monitoring                  = var.monitoring
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    encrypted             = var.root_volume_encrypted
    delete_on_termination = var.root_delete_on_termination
  }

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )

  volume_tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
