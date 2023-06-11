# Install ngrok and set up localhost tunnel

1. Download [https://ngrok.com/download](https://ngrok.com/download)

2. `unzip` downloaded file to `/usr/bin`

    `sudo unzip /path/to/ngrok.zip`
    
    `sudo cp ngrok /usr/bin/`
    
3. To start & enable localhost tunnel in background
	
	`nohup ngrok http 3000 &` 
	
	            or
		    
	`ngrok http 5000 > /dev/null &` 
	
4. Then use `localhost:4040/status` to get/check the url status

5. To stop ngrok
    `pkill ngrok`
