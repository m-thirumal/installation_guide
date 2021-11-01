### How to remove PostgresSQL on ubuntu

    sudo apt-get --purge remove postgresql

##### Grep for all PostgreSQL packages in Debian Linux

    dpkg -l | grep postgres
    --Add all the list in the below line
    sudo apt-get --purge remove {POSTGRESS-PACKAGE NAME}

##### directory data postgresql

    sudo rm -rf /var/lib/postgresql

##### directory log postgresql

    sudo rm -rf /var/log/postgresql/

##### directory base postgresql

    sudo rm -rf /etc/postgresql/

##### Delete User

    sudo deluser postgres

##### Delete Group

    sudo delgroup postgres

####
    sudo apt-get --purge remove pgdg-keyring 
    sudo apt-get --purge remove  postgresql-13  postgresql-client-common postgresql-common
