packer {
  required_plugins {
    docker = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "backend_image_name" {
  type    = string
  default = "garg-electronics-backend"
}
variable "backend_version" {
  type    = string
  default = "1.1.0"
}

source "docker" "backend" {
  image  = "node:18-alpine"
  commit = true
}

build {
  name    = "backend-${var.backend_image_name}-${var.backend_version}"
  sources = ["source.docker.backend"]

  provisioner "shell" {
    inline = [
      "mkdir /app",
      "cp -r /local/path/to/backend/* /app",
      "cd /app",
      "npm ci --only=production",
    ]
  }

  provisioner "shell" {
    inline = [
      "docker tag garg-electronics-backend:latest ghcr.io/cgarg547/garg-electronics-backend:${var.backend_version}"
    ]
  }
}
