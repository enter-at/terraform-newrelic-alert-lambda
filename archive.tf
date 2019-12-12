resource "random_uuid" "id" {}

data "null_data_source" "dist" {
  inputs = {
    path = "${path.module}/dist/${random_uuid.id.result}"
  }
}

data "null_data_source" "archive" {
  inputs = {
    path = "${data.null_data_source.dist.outputs.path}.zip"
  }
}

resource "null_resource" "build" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "${path.module}/build.sh"
    environment = {
      SOURCE_DIR    = var.source_dir
      DIST_DIR      = data.null_data_source.dist.outputs.path
      RSYNC_PATTERN = join(" ", var.rsync_pattern)
    }
  }
}

data "archive_file" "function" {
  type        = "zip"
  source_dir  = data.null_data_source.dist.outputs.path
  output_path = data.null_data_source.archive.outputs.path

  depends_on = [
    null_resource.build
  ]
}
