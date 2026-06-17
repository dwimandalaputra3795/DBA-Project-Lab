# PostgreSQL 17 Installation Guide on Rhel 9

## Deskripsi
Dokumentasi Instalasi PostgreSQL 17
Pada Red Hat Enterprise Linux 9.

## Environment

Komponen   | Versi   |
-----------|---------|
OS         | Rhel 9  |
PostgreSQL |   17    |
User       |Postgres |
----------------------

## 1. Install the repository RPM:

``bash

sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

## 2. Nonaktifkan PosgtgreSQL bawaan OS

``bash

sudo dnf -qy module disable postgres

## 3. Install PostgreSQL 17

``bash

sudo dnf install -y postgresql17-server postgresql17

## 4. Inisialisasi database cluster

``bash

sudo /usr/pgsql-17/bin/postgresql-17-setup initdb

## 5. Start dan Enable Service

``bash

sudo systemctl enable postgresql-17
sudo systemctl start postgresql-17

## 6. Cek status 

``bash

sudo systemctl status postgresql-17

## 7. Cek versi Postgresql

``bash

psql --version

## 8. Pengecekan setelah instalasi

- cek lokasi data directory dari PostgreSQL
- Cek lokasi File Konfigurasi
- Cek lokasi pg_hba.conf
- Cek Port PostgreSQL



