variable "source_image" {
  description = "Nombre de la imagen local (e.g. myapp:latest)"
  type        = string
}

variable "target_registry" {
  description = "Registro destino (e.g. ghcr.io/usuario)"
  type        = string
}

variable "repository" {
  description = "Nombre del repositorio en el registry (e.g. myapp)"
  type        = string
}

variable "tag" {
  description = "Tag de la imagen (e.g. latest)"
  type        = string
}

variable "username" {
  description = "Usuario para autenticarse en el registry"
  type        = string
}

variable "password" {
  description = "Password/token para autenticarse en el registry"
  type        = string
  sensitive   = true
}
