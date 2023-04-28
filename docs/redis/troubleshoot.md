# Troubleshoot

Error ` MISCONF Redis is configured to save RDB snapshots`

Solution: 

Check the status

`sudo service redis status`

If, it shows the following error message
```
ubuntu@ip-172-31-18-107:~$ sudo service redis status
● redis-server.service - Advanced key-value store
     Loaded: loaded (/lib/systemd/system/redis-server.service; enabled; vendor >
     Active: deactivating (stop-sigterm) since Fri 2023-04-28 08:34:09 UTC; 10m>
       Docs: http://redis.io/documentation,
             man:redis-server(1)
   Main PID: 460 (redis-server)
     Status: "Error trying to save the DB, can't exit."
      Tasks: 5 (limit: 9399)
     Memory: 5.7M
        CPU: 13.539s
     CGroup: /system.slice/redis-server.service
             └─460 "/usr/bin/redis-server 0.0.0.0:6379" "" "" "" "" 
```
then shutdown from redis-cli
             
```
redis-cli
127.0.0.1:6379> shutdown
(error) ERR Errors trying to SHUTDOWN. Check logs.
127.0.0.1:6379> shutdown NOSAVE
not connected>
```

Start the redis server

```
sudo service redis start
```
