## Enable redis remote access

1. Locate and open redis confi file

```
sudo vi /etc/redis/redis.conf
```
	
2. Change bind 

```
127.0.0.1 to bind 0.0.0.0 
```

3. Restart the redis-server
	
```
sudo service redis-server restart
```
	
### Supervised

Inside the file, find the supervised directive. This directive allows you to declare an init system to manage Redis as a service, providing you with more control over its operation. The supervised directive is set to no by default. Since you are running Ubuntu, which uses the systemd init system, change this to systemd:

```
supervised systemd
```
