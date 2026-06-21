# PostgreSQL Replication Lab

## Objective
Implement Streaming Replication PostgreSQL 17

## Architecture

      Primary Server
             |
             |
      Standby Server

## Primary Server

- membuat user
- Konfigurasi postgresql.conf
    ```conf 
    Listen Addresses = '*'
    password_encryption = scram-sha-256 
    wal_level = replica 
    max_wal_senders = 10 
    hot_standby = on

- Konfigurasi pg_hba.conf
    ```conf
    host | replication | dwi | 192.168.101.7/24 | scram-sha-256 |

- Restart PostgreSQL
    ```bash
    systemctl restart postgresql-17

## Standby Server

- Stop PostgreSQL
    ```bash
    systemctl stop postgresql-17
- Menghapus data directory
- backup data directory dari primary ke standby
  ```bash
    pg_basebackup -h 192.168.101.8 -p 5432 -D /var/lib/pgsql/17/data -U dwi -Fp -Xs -P -R

keterangan :
- Start PostgreSQL
    ```bash
    systemctl start postgresql-17
- Cek status PostgreSQL
    ```bash
    systemctl status postgresql-17

## Monitoring Queries
- pg_stat_replication
- pg_stat_wal

## Tested On
- PostgreSQL 17
- RHEL 9



