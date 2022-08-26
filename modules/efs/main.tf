resource "aws_efs_file_system" "this" {
  count = var.create ? 1 : 0

  encrypted                       = true
  kms_key_id                      = var.efs_kms_key_id
  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.throughput_mode == "provisioned" ? var.provisioned_throughput : null
  tags                            = var.additional_tags
  throughput_mode                 = var.throughput_mode
}


resource "aws_efs_mount_target" "this" {
  count = var.create ? length(var.subnets) : 0

  file_system_id  = aws_efs_file_system.this[0].id
  security_groups = [data.aws_security_group.nfs.id]
  subnet_id       = var.subnets[count.index]
}

resource "aws_efs_access_point" "test" {
  file_system_id = aws_efs_file_system.this[0].id
}

resource "aws_efs_backup_policy" "policy" {
  file_system_id = aws_efs_file_system.this[0].id

  backup_policy {
    status = "ENABLED"
  }
}
