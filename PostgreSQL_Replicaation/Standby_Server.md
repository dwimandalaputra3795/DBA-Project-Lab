## Standby Server

- Stop PostgreSQL
    ```bash
    systemctl stop postgresql-17
    
- Menghapus data directory
    ```bash
    rm -rf /var/lib/pgsql/17/*
    
- backup data directory dari primary ke standby
  ```bash
    pg_basebackup -h 192.168.101.8 -p 5432 -D /var/lib/pgsql/17/data -U dwi -Fp -Xs -P -R


- Start PostgreSQL
    ```bash
    systemctl start postgresql-17
- Cek status PostgreSQL
    ```bash
    systemctl status postgresql-17
