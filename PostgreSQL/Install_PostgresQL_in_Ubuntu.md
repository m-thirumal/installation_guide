# Install PostgreSQL in Ubuntu

## Enable PostgreSQL Apt Repository

```
sudo apt-get install wget ca-certificates

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

```

## Install PostgreSQL on Ubuntu

```
sudo apt-get update

sudo apt-get install postgresql postgresql-contrib

```

### Alter PostgreSQL password

```
sudo -u postgres psql

```