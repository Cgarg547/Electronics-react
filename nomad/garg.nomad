job "garg-electronics" {
  datacenters = ["dc1"]
  type        = "service"

  group "backend" {
    count = 2

    network {
      mbits = 10
      port "http" { static = 5000 }
    }

    task "api-backend" {
      driver = "docker"
      config {
        image = "ghcr.io/cgarg547/garg-electronics-backend:1.1.0"
        ports = ["http"]
      }
      env {
        MONGODB_URI = "${NOMAD_SECRET_mongodb_uri}"
        JWT_SECRET  = "${NOMAD_SECRET_jwt_secret}"
      }
      resources {
        cpu    = 500
        memory = 512
      }
      service {
        name = "garg-backend"
        port = "http"
        check {
          type     = "http"
          path     = "/health"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }

  group "frontend" {
    count = 2

    network {
      mbits = 10
      port "web" { static = 3000 }
    }

    task "ui-frontend" {
      driver = "docker"
      config {
        image = "ghcr.io/cgarg547/garg-electronics-frontend:1.1.0"
        ports = ["web"]
      }
      resources {
        cpu    = 300
        memory = 256
      }
      service {
        name = "garg-frontend"
        port = "web"
        check {
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
