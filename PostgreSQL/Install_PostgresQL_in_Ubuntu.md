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
On successful installation, the PostgreSQL service starts automatically and can be verified as below.


```
db1@1:~$ systemctl status postgresql
● postgresql.service - PostgreSQL RDBMS
     Loaded: loaded (/lib/systemd/system/postgresql.service; enabled; vendor pr>
     Active: active (exited) since Wed 2022-06-08 11:07:21 UTC; 17h ago
   Main PID: 969 (code=exited, status=0/SUCCESS)
        CPU: 3ms

Jun 08 11:07:21 1 systemd[1]: Starting PostgreSQL RDBMS...
Jun 08 11:07:21 1 systemd[1]: Finished PostgreSQL RDBMS.
```

##### Alter PostgreSQL password

   `sudo -u postgres psql`

   `ALTER USER postgres PASSWORD 'NEWPASSWORD';`



## Access PostgreSQL over remote network

#### Change listen_address `localhost to *` in  file  `/etc/postgresql/{version_number}/main/postgresql.conf`
```
    # - Connection Settings -
    listen_addresses = '*'          # what IP address(es) to listen on;     
```

#### Changes in `pg_hba.conf`

Add the following line in `# IPv4 local connections`:

	host    all             all             0.0.0.0/0               md5

and comment

	#host    all             all             127.0.0.1/32            md5


`Ident` – supported via TCP/IP connections only. It obtains the clients system username with an optional username mapping.

`Password` – a role connects using a password.

`Peer` – similar to ident but only suppoted on local connections.

`Trust` – allows a role to connect as long as conditions defined in the pg_hba.conf are fulfilled.

##### Known Problem

* Check the permission problem in `/var` directory to create folder for `data` and `log`.
