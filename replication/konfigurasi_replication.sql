## Server Utama (Master)

sudo -u postgres -i psql
CREATE ROLE dwi WITH REPLICATION PASSWORD LOGIN 'lalapopo123';
\du (mengecek tabel user)
\q (keluar psql)
sudo nano /var/lib/pgsql/17/data/postgresql.conf
sudo nano /var/lib/pgsql/17/data/pg_hba.conf
sudo systemctl restrat postgresql-17

## Server Relipka (Standby)
sudo systemctl stop postgresql-17
sudo rm -rf /var/lib/pgsql/17/data/*
sudo pg_basebackup -h 192.168.101.8 -p 5432 -D /var/lib/pgsql/17/data -U dwi -Fp -Xs -P -R
passowrd : (masukan password yang kita buat di master)
sudo systemctl start postgresql-17
sudo systemctl status postgresql-17

## pengecekan apakah server berjalan 
# cek server replika 
SELECT * FROM pg_stat_wal_receiver; (melihat status proses WAL Receiver pada server standby/replica PostgreSQL.)
SELECT pg_is_in_recovery(); (outputnya harus t atau true di server replika/standby)

# cek server di master
SELECT * FROM pg_stat_replication; (melihat status replikasi yang sedang berjalan pada server PostgreSQL primary (master))
SELECT pg_is_in_recovery(); (outputnya harus f atau false di server master/utama)
