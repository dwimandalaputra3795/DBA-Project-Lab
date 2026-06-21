## Primary Server

- membuat user
- Konfigurasi postgresql.conf
    ```conf
    sudo nano /var/lib/pgsql/17/data/postgresql.conf
    
    Listen Addresses = '*'
    password_encryption = scram-sha-256 
    wal_level = replica 
    max_wal_senders = 10 
    hot_standby = on

- Konfigurasi pg_hba.conf
    ```conf
    sudo nano /var/lib/pgsql/17/data/pg_hba.conf
    
    host | replication | dwi | 192.168.101.7/24 | scram-sha-256 |

- Restart PostgreSQL
    ```bash
    systemctl restart postgresql-17
