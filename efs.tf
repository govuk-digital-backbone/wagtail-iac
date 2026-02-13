resource "aws_efs_access_point" "efs_ap_app_data" {
  file_system_id = var.efs_id

  root_directory {
    path = "/${local.task_name}/app/data"
    creation_info {
      owner_uid   = 0
      owner_gid   = 0
      permissions = "755"
    }
  }

  posix_user {
    # the user Fargate tasks will run as
    uid = 0
    gid = 0
  }

  tags = {
    Name = "${local.task_name}-efs-ap-app-data"
  }
}
