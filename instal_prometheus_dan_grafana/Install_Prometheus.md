# install Prometheus

  - membuat user prometheus
  - Download Prometheus
    ```bash
    wget https://github.com/prometheus/prometheus/releases/download/v2.54.1/prometheus-2.54.1.linux-amd64.tar.gz

  - Extract
    ```bash
    tar -xvf prometheus-*.tar.gz
  - Edit config Prometheus
    ```bash
    sudo vi /etc/prometheus/prometheus.yml
    
    Isi :
        global:
          scrape_interval: 15s
        
        scrape_configs:
          - job_name: "prometheus"
            static_configs:
              - targets: ["localhost:9090"]
    
  - Buat service systemd
      ```bash
      sudo vi /etc/systemd/system/prometheus.service
    
      Isi:
        [Unit]
        Description=Prometheus
        Wants=network-online.target
        After=network-online.target
        
        [Service]
        User=prometheus
        ExecStart=/usr/local/bin/prometheus \
          --config.file=/etc/prometheus/prometheus.yml \
          --storage.tsdb.path=/var/lib/prometheus
        
        [Install]
        WantedBy=multi-user.target

  - Start Prometheus
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl enable prometheus
    sudo systemctl start prometheus
    sudo systemctl status prometheus
          
