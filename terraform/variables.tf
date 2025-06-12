variable "source_image" {
  type        = string
  default     = "devops-reto-entorno:latest"
}

variable "target_registry" {
  type        = string
  default     = "ghcr.io/emperator777"
}

variable "repository" {
  type        = string
  default     = "devops-reto-entorno"
}

variable "tag" {
  type        = string
  default     = "latest"
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}


