# Persist the docker data

-v => stands for volume to map docker and host directory

### Bind Host directory with docker directory

    sudo docker run --name pgadmin -p 80:80 -v /var/lib/pgadmin:/var/lib/pgadmin  -e 'PGADMIN_DEFAULT_EMAIL=m.thirumal@hotmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=thirumal' -d dpage/pgadmin4

### Default Container volume

By default, when a container gets create, it also creates a volume/folder in `/var/lib/docker/volumes` and that will get delete when the container removed.

To keep the data persistant, (Create/Bind Volume)

### Create VOLUME 

The volume/directory  will be created under `/var/lib/docker/volumes`

    docker volume create postgresql_volume

#### List volumes

    docker volume ls

#### Map volume

    docker run -d -v postgresql_volume:/var/lib/postgres --name postgres -p 5432:5432 postgres:latest

#### Delete the container and volume

    docker rm -fv {container_id}

#### Dangling volume
The volume which are create with container but not deleted.

To remove all dangling volume

    docker volume rm $(docker volume ls -f=dangling=true -q)

