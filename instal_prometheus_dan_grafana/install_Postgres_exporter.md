### Install Postgres Exporter

  - membuat user exporter
  - Download postgres_expoter
    ```bash
    cd /opt
    wget https://github.com/prometheus-community/postgres_exporter/releases/download/v0.19.1/postgres_exporter-0.19.1.linux-    amd64.tar.gz

  - EXTRACT FILE
    ```bash
    tar -xvf postgres_exporter-*.tar.gz
    cd postgres_exporter-*.linux-amd64

  - INSTALL BINARY
    ```bash
    sudo mv postgres_exporter /usr/local/bin/

  - BUAT USER DATABASE UNTUK MONITORING
  - SET CONNECTION STRING
    ```bash
    sudo nano /etc/default/postgres_exporter

    DATA_SOURCE_NAME="postgresql://exporter:exporter123@localhost:5432/postgres?sslmode=disable"

  - BUAT SYSTEMD SERVICE
    ```bash
    sudo nano /etc/systemd/system/postgres_exporter.service

    [Unit]
    Description=PostgreSQL Exporter
    Wants=network-online.target
    After=network-online.target
    
    [Service]
    User=postgres_exporter
    EnvironmentFile=/etc/default/postgres_exporter
    ExecStart=/usr/local/bin/postgres_exporter
    
    [Install]
    WantedBy=multi-user.target
    
  - START SERVICE
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl enable postgres_exporter
    sudo systemctl start postgres_exporter
    sudo systemctl status postgres_exporter

### CEK PORT EXPORTER
  - Cek Port
    ```bash
    ss -tulnp | grep 9187

  - Test Browser
    ```bash
    http://DB_SERVER_IP:9187/metrics

  - TAMBAHKAN KE PROMETHEUS SERVER
    ```bash
    sudo nano /etc/prometheus/prometheus.yml

    scrape_configs:
      - job_name: "postgres"
        static_configs:
          - targets: ["192.168.101.8:9187"]

  - Restart Prometheus
    ```bash
    systemctl restart prometheus
      
