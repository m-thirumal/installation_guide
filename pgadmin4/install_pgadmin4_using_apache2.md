# Install PgAdmin 4 using Apache2 in Ubuntu    

Add GPG key and repository  
```
    sudo apt-get install wget ca-certificates 
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - 
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' 
```
Install PgAdmin4 & apache2 with default e-mail/user-id and password

```
        sudo apt-get install pgadmin4 pgadmin4-apache2 
```
Enter your email & password to complete the installation process 

Go to [http://localhost/pgadmin4](browser) and login with email & password

     

 