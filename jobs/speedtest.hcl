job "speedtest" {
  type = "batch"

  periodic {
    crons = [
      "@daily"
    ]
    prohibit_overlap = true
  }

  group "default" {
    task "speedtest" {
      driver = "exec"

      config {
        command = "/bin/bash"
        args    = ["local/speedtest.sh"]
      }

      template {
        destination = "local/speedtest.sh"
        perms       = "0755"

        data = <<EOF
        #!/bin/bash
        echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
        speedtest-cli --simple --secure | awk '{print $0 "\\n"}'
        echo "--------------------------------"
        EOF
      }
    }
  }
}
