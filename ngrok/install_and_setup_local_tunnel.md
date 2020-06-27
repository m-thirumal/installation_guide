# Install ngrok and set up localhost tunnel

1. Download [https://ngrok.com/download](ngrok)

2. `unzip` downloaded file to `/usr/bin`

    `sudo unzip /path/to/ngrok.zip /usr/bin`
    
3. To start & enable localhost tunnel in background
	
	`nohup ngrok http 3000 &` 