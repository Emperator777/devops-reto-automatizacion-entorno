module "docker_push" {
  source          = "./modules/docker_push"
  source_image    = var.source_image
  target_registry = var.target_registry
  repository      = var.repository
  tag             = var.tag
  username        = var.username
  password        = var.password
}
