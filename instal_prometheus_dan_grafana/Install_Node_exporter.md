### install node expoter

  - membuat user node_exporter
  - Download node_exporter
    ```bash
    cd /opt
    wget https://github.com/prometheus/node_exporter/releases/download/v1.11.1/node_exporter-1.11.1.linux-amd64.tar.gz

  - Extract File
    ```bash
    tar -xvf node_exporter-*.tar.gz
    cd node_exporter-*.linux-amd64

  - Install Binary
    ```bash
    sudo mv node_exporter /usr/local/bin/

  - Buat systemd service
    ```bash
    sudo nano /etc/systemd/system/node_exporter.service

    [Unit]
    Description=Node Exporter
    Wants=network-online.target
    After=network-online.target
    
    [Service]
    User=node_exporter
    ExecStart=/usr/local/bin/node_exporter
    
    [Install]
    WantedBy=multi-user.target

  - Buka Service
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl enable node_exporter
    sudo systemctl start node_exporter
    sudo systemctl status node_exporter

### CEK PORT NODE_EXPORTER
  - Cek Port
    ```bash
    ss -tulnp | grep 9100

  - Test Browser
    ```bash
    http://192.168.101.8:9100/metrics

  - Tambahkan ke Prometheus
    ```bash
    sudo nano /etc/prometheus/prometheus.yml

    scrape_configs:
      - job_name: "node_exporter"
        static_configs:
          - targets:
              - "192.168.101.8:9100"

  - Restrat Prometheus
    ```bash
    systemctl restart prometheus
