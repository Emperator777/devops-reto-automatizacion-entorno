# 1) Login al registry
resource "null_resource" "login" {
  provisioner "local-exec" {
    command = <<EOT
        echo "${var.password}" | sudo docker login ${var.target_registry} -u ${var.username} --password-stdin
    EOT
  }
}

# 2) Taggeado de la imagen
resource "null_resource" "tag" {
  depends_on = [null_resource.login]
  provisioner "local-exec" {
    command = "sudo docker tag ${var.source_image} ${var.target_registry}/${var.repository}:${var.tag}"
}

}

# 3) Push de la imagen
resource "null_resource" "push" {
  depends_on = [null_resource.tag]
  provisioner "local-exec" {
    command = <<EOT
      echo "${var.password}" \
        | sudo docker login ${var.target_registry} -u ${var.username} --password-stdin \
        && sudo docker push ${var.target_registry}/${var.repository}:${var.tag}
    EOT
  }
}

