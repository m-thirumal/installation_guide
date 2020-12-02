### How to remove PostgresSQL on ubuntu

    sudo apt-get — purge remove postgresql

    dpkg -l | grep postgres

    sudo apt-get — purge remove pgdg-keyring postgresql*

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
