# Port Forwarding(Virtual IP) with FortiGate firewall

Forwarding IP (internet) to local/internal server VM ip addresses

Device : FortiGate 60D

Configuration Setps:-

1. Virtual IP

2. Firewall Policy

## Virtual IP
![Virutal IP List](img/virtual%20ip.png)

1. Login to Fortinet, and go to `Policy & Objects` -> `Objects` and select `Vitual IPs` & `create new Virtual IPs`

    * Select interface `WAN 1`
    * Give external IP address /range
        `0.0.0.0` - Can be accessed from any where
    * Give Map to port
        `192.168.0.27` - Destination internal VM ip address
    * Enable Port
        ** Give same port on both external and internal to map

## Firewall Policy

1. Create `New Policy` with following configuration

    * Incomming interface `WAN 1` - same as vitual ip interface
    * Source `all`
    * Destination 
        ** Newly created vitual ip
    * Schedule - alway
    * service - all
    * NAT - off