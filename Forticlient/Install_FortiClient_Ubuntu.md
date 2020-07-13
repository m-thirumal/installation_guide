# Install FortiClient in Ubuntu

1. Download Foriclient 6.4

	`wget -c 'https://filestore.fortinet.com/forticlient/downloads/FortiClientFullVPNInstaller_6.4.0.0851.deb'`
	
2. Install using the following commands

	`sudo dpkg -i FortiClientFullVPNInstaller_6.4.0.0851.deb`
	
3. If you are getting any dependencies error then `run` the following commands
	```
	sudo apt --fix-broken install
	sudo dpkg -i FortiClientFullVPNInstaller_6.4.0.0851.deb
	```




![FortiClient output](Forticlient.png)  

### Tested with Ubuntu 20.04
