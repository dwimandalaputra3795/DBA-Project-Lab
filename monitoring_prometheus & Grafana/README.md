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
- Node_exporter mengirim metrik server
- Prometheus mengambil dan menyimpan metrik tersebut
- Grafana membaca data dari Prometheus
- Dashboard menampilkan grafik dan status server secara real-time.
