## install Prometheus v3.12.0

  - membuat user prometheus
  - membuat direktory
    ```bash
    sudo mkdir /etc/prometheus
    sudo mkdir /var/lib/prometheus
    
  - Download Prometheus
    ```bash
    cd /opt
    wget https://github.com/prometheus/prometheus/releases/download/v3.12.0/prometheus-3.12.0.linux-amd64.tar.gz

  - Extract
    ```bash
    tar -xzf prometheus-3.12.0.linux-amd64.tar.gz
    cd prometheus-3.12.0.linux-amd64

  - Copy binary
    ```bash
    sudo cp prometheus /usr/local/bin/
    sudo cp promtool /usr/local/bin/
    
    sudo chmod +x /usr/local/bin/prometheus
    sudo chmod +x /usr/local/bin/promtool

  - Copy file konfigurasi
    ```bash
    sudo cp prometheus.yml /etc/prometheus/

  - Ubah kepemilikan folder
    ```bash
    sudo chown -R prometheus:prometheus /etc/prometheus
    sudo chown -R prometheus:prometheus /var/lib/prometheus
    
  - Buat service systemd
      ```bash
      sudo nano /etc/systemd/system/prometheus.service
    
      Isi:
      
        [Unit]
        Description=Prometheus
        After=network.target
        
        [Service]
        User=prometheus
        Group=prometheus
        Type=simple
        
        ExecStart=/usr/local/bin/prometheus \
          --config.file=/etc/prometheus/prometheus.yml \
          --storage.tsdb.path=/var/lib/prometheus \
          --web.console.templates=/etc/prometheus/consoles \
          --web.console.libraries=/etc/prometheus/console_libraries
        
        Restart=always
        
        [Install]
        WantedBy=multi-user.target

  - Start dan Cek Status Prometheus
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl enable prometheus
    sudo systemctl start prometheus
    sudo systemctl status prometheus
          
