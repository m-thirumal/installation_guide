# Install PostgreSQL in Ubuntu

#### Enable PostgreSQL Apt Repository

```
sudo apt-get install wget ca-certificates

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

```

## Install PostgreSQL on Ubuntu

```
sudo apt-get update

sudo apt-get install postgresql postgresql-contrib

sudo  apt-get install postgresql-client 

```

##### Alter PostgreSQL password

   `sudo -u postgres psql`

   `ALTER USER postgres PASSWORD 'NEWPASSWORD'` 
  


## Access PostgreSQL over network

#### Change listen_address `localhost to *` in  file  /etc/postgresql/{version_number}/main/postgresql.conf 
```
    # - Connection Settings - 
    listen_addresses = '*'          # what IP address(es) to listen on;     
```

#### Changes in `pg_hba.conf`

Add the following line in `# IPv4 local connections`:

	host    all             all             0.0.0.0/0               md5

and comment

	#host    all             all             127.0.0.1/32            md5
