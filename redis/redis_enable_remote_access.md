# Enable redis remote access

1. Locate and open redis confi file

	```sudo vi /etc/redis/redis.conf```
	
2. Change bind ```127.0.0.1 to bind 0.0.0.0 ```

3. Restart the redis-server
	
	```sudo service redis-server restart```