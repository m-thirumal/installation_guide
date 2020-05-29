# Update PgAdmin4 docker image

1. Pull the latest docker image

```
 sudo docker pull dpage/pgadmin4
```

2. Remove existing container

```
 sudo docker rm pgadmin
```

3. Run the latest images

```
 sudo docker run --name pgadmin -p 80:80 -v /var/lib/pgadmin:/var/lib/pgadmin  -e 'PGADMIN_DEFAULT_EMAIL=m.thirumal@hotmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=thirumal' -d dpage/pgadmin4
```

![output](Pgadmin4.png)