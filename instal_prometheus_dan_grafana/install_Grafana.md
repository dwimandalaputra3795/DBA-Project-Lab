# Install Grafana

  - install grafana
    ```bash
    sudo dnf install grafana -y

  - Start Grafana
    ```bash
    sudo systemctl enable grafana-server
    sudo systemctl start grafana-server
    sudo systemctl status grafana-server

  - Akses Grafana
    ```bash
    http://IP-SERVER:3000

    login default :
    
          username: admin
          password: admin

    - Ganti password


# CONNECT GRAFANA KE PROMETHEUS

  - Di Grafana
    ```bash
    Settings ⚙ → Data Sources → Add data source

    pilih : Prometheus

  - Masukkan URL
    ```bash
    http://localhost:9090
      
    
