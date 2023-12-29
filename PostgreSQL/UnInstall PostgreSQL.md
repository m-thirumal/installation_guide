### How to remove PostgresSQL on ubuntu

```shell
sudo apt-get --purge remove postgresql
```

##### Grep for all PostgreSQL packages in Debian Linux

```shell
dpkg -l | grep postgres

-- Add all the list in the below line

sudo apt-get --purge remove {POSTGRESS-PACKAGE NAME}
```

##### Delete `data/log/conf` postgresql

```shell
sudo rm -rf {/var/{lib,log},etc}/postgresql/
```

##### directory data postgresql

```shell
sudo rm -rf /var/lib/postgresql
```

##### directory log postgresql

```shell
sudo rm -rf /var/log/postgresql/
```

##### directory base postgresql

```shell
sudo rm -rf /etc/postgresql/
```

##### Delete User

```shell
sudo deluser postgres
```

##### Delete Group

```shell
sudo delgroup postgres
```
