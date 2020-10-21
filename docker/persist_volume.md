# Persist the docker data

-v => stands for volume to map docker and host directory

    sudo docker run --name pgadmin -p 80:80 -v /var/lib/pgadmin:/var/lib/pgadmin  -e 'PGADMIN_DEFAULT_EMAIL=m.thirumal@hotmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=thirumal' -d dpage/pgadmin4
