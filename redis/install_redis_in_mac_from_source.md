# Install Redis in MAC OS from source code

1. Create and change directory
	
	```mkdir redis && cd redis```

2. Download the source and extract

	```curl -O http://download.redis.io/redis-stable.tar.gz```
	
3. Run the test and install
	```
	
	make
	make test
	sudo make install
		
	``` 
	
4. Start the redis-server

	```redis-server```
	
# Test with redi-cli

	redis-cli ping 


If the above command returns pong then redis is installed correctly and working good