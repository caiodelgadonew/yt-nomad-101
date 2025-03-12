job "wordpress" {
  group "wordpress" {
    network {
      port "http" {
        to = 80
      }
      port "mysql" {
        to = 3306
      }
    }

    service {
      provider = "nomad"
      name     = "wordpress"
      port     = "http"
    }

    task "wordpress" {
      driver = "docker"

      config {
        image = "wordpress"
        ports = ["http"]
      }
      env {
        WORDPRESS_DB_HOST     = "${NOMAD_ADDR_mysql}"
        WORDPRESS_DB_USER     = "wpuser"
        WORDPRESS_DB_PASSWORD = "caiodelgadonew@youtube"
        WORDPRESS_DB_NAME     = "wordpress"
      }
    }

    task "database" {
      driver = "docker"

      config {
        image = "mysql:5.7"
        ports = ["mysql"]
      }
      env {
        MYSQL_DATABASE             = "wordpress"
        MYSQL_USER                 = "wpuser"
        MYSQL_PASSWORD             = "caiodelgadonew@youtube"
        MYSQL_RANDOM_ROOT_PASSWORD = "1"
      }
    }
  }
}
