# Uninstall Redis From Ubuntu

## Stop the Redis Service

```shell
sudo systemctl stop redis
```

## Remove Redis Packages

```shell
sudo apt-get purge --auto-remove redis-server
```

## Remove Redis Configuration and Data Files

```shell
sudo rm -r /etc/redis/
sudo rm -r /var/lib/redis/
```


## Remove Redis User and Group

```shell
sudo deluser redis
sudo delgroup redis
```
