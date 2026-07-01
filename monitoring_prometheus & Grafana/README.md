# Monitoring menggunakan Prometheus & Grafana

## Infrastruktur

              monitoring
            /            \
           /              \ 
        Server          PostgreSQL
          |                 |
      Node_Exporter    Postgres_Exporter
          |                 |
      Prometheus        Prometheus
          |                 |
       Grafana           Grafana
          |                 |
      Dashboard          Dashboard

## Alur kerjanya
### Node_Exporter
- Node_exporter mengirim metrik server
- Prometheus mengambil dan menyimpan metrik tersebut
- Grafana membaca data dari Prometheus
- Dashboard menampilkan grafik dan status server secara real-time.

### Postgres_Exporter
- Postgres_exporter mengirim metrik PostgreSQL
- Prometheus mengambil dan menyimpan metrik tersebut
- Grafana membaca data dari Prometheus
- Dashboard menampilkan grafik dan status server secara real-time.
  
## Features Monitoring
- CPU
- Memory Usage
- Memory Available
- Total RAM Server
- Network Receive
- Network Transmit
- Disk
- Load Avarage
- Uptime Server
- Jumlah Database
- Ukuran WAL
- Database Size
- Commit Persecond
- Rolback Persecond
- Total Transaction
