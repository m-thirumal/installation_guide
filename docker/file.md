## Copy files from host to docker container

  docker cp {filename} {container_name}:/{destination}

  docker cp thirumal.txt nginx1:/var/www/

## Copy files from docker container to host

  docker cp {container_name}:/{source path}  /{destination}

  docker cp nginx1:/var/www/thirumal.txt .
