# Build Docker image

    docker build -t {tag name} -f {DockerFile} {location_of_DockerFile}
    docker build -t sample -f DockerFile .

### Copy Files from local/host while build

    FROM ubuntu
    RUN apt install nginx
    COPY /home/thirumal/git/html /var/www/html

    -----Build Now-------
    docker build -t custom_ngnix -f DockerFile .

### Copy/Add files from INTERNET

    FROM ubuntu
    RUN apt install nginx
    ADD https:github.com/M-thirumal/abc.zip /var/www/html/abc.zip
    RUN cd /var/www/html && unzip abc.zip && mv abc/* /var/www/html/
    CMD nginxctl -DFOREGROUND

    -----Build Now-------
    docker build -t custom_ngnix -f DockerFile .
