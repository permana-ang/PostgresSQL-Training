# LAB 1. SETUP POSTGRESQL

## 1.1 Instalasi
## 1.2 Akses Databases
## 1.3 Setting Environment Variable


# 1.1 Instalasi

Jalankan perintah berikut sebagai user **root**:

```bash
sudo apt install curl ca-certificates
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
. /etc/os-release
sudo sh -c "echo 'deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
sudo apt update
```

### Instalasi PostgreSQL

```bash
sudo apt -y install postgresql-17
````

## Verifikasi setelah instalasi:

```bash
systemctl status postgresql
````

## Lokasi data directory:

```bash
ls /var/lib/postgresql/17/main/
````

## Lokasi file konfigurasi:

```bash
ls /etc/postgresql/17/main/
````

## Lokasi file log:

```bash
tail -f /var/log/postgresql/postgresql-17-main.log
````

# 1.2 Akses Databases

## Masuk ke server linux dengan user postgres:

```bash
su - postgres
````

## Koneksi ke cluster database dengan alat psql:
```bash
psql -d postgres -U postgres
````

## Atur password user postgres yang ada di dalam cluster database, yaitu postgres:
```bash
ALTER USER postgres PASSWORD 'postgres';
````

## Akses tanpa user postgres di server linux:
```bash
psql -h localhost -d postgres -U postgres -p 5432
````
Keterangan:

-h : alamat IP atau host database cluster
-d : nama database
-U : user
-p : port database cluster

# 1.3 Setting Environment Variable

## Lokasi file binary program postgreSQL:
```bash
ls /usr/lib/postgresql/17/bin/
````
folder/directory tersebut berisi alat-alat yang bisa digunakan untuk mengoperasikan postgreSQL. Coba pastikan apakah file pg_ctl ada?

## Gunakan user postgres Buat file bash_profile untuk mengatur environment variable:
```bash
vim $HOME/.bashrc
````

## Isi file dengan variable berikut:
```bash
PATH=/usr/lib/postgresql/17/bin:$PATH
export PGDATA=/var/lib/postgresql/17/main/
export PGUSER=postgres
export PGPORT=5432
export PGDATABASE=postgres
````
Ini berfungsi agar lebih mudah dalam menggunakan alat pg_ctl sehingga tidak perlu menuliskan lokasi data, user, port, dan opsi lainnya.

## Gunakan user root Jalankan perintah berikut untuk mengaktifkan env variable:
```bash
echo "source /var/lib/postgresql/.bashrc" >> /etc/bash.bashrc
````
fungsinya agar bash_profile yang sudah dibuat, selalu dimuat ketika kita masuk dengan user postgres pada server linux.

Verifikasi environment variable berhasil diatur dengan perintah berikut:
```bash
pg_ctl status
````




