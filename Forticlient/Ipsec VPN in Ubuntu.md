### Connect to IPSec VPN in Ubuntu

#### Install

    sudo add-apt-repository ppa:nm-l2tp/network-manager-l2tp
    sudo apt update
    sudo apt-get install network-manager-l2tp  network-manager-l2tp-gnome

### configure

* Go to `Network` and click on `+` in `VPN`
* Select `Layer 2  Tunneling Protocol(L2TP)` in the pop-up window
* Enter the gateway IP, uesr name, password
* Click on `IPsec Settings`
    * Check `Enable IPSec tunnel to L2TP host`
    * Enter the pre-shared key
* Connect to VPN !!!!


### Known problems

* Internet access
    * Go to `VPN` -> `IPv4` -> check on `Use this connection only for reources on it's network`
