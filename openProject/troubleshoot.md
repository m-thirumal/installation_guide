# Troubleshoot

## Database Configuration

   To check database configuration - `vi /etc/openproject/conf.d/00_addon_postgres`

## Trouble during update

   Reconfigure the `openproject`

``` bash
 sudo openproject reconfigure
```

Skip installation of apache.


## HTTPS mode setup mismatch

### Error:

```
Your application is running with HTTPS mode set to http, but the request is an https request. This will result in errors! You will need to set the following configuration value: OPENPROJECT_HTTPS=true. Please see the installation documentation on how to set this configuration. 
```

#### Solution

Open  `vi /etc/openproject/conf.d/other` and set the following variable value as `true`.

```
export OPENPROJECT_HTTPS="true"
```
## Invalid Host name

Replace the public ip in the below commands,

```
sudo openproject config:set host_name=3.109.45.123
sudo openproject config:set protocol=http
sudo openproject reconfigure
```
and set the `Public DNS` in the reconfigure