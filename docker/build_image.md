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

### Environment variable

    ENV

### Working Directory

    FROM ubuntu
    RUN apt install nginx
    WORKDIR /var/www/html
    ADD https:github.com/M-thirumal/abc.zip ./abc.zip
    
    RUN unzip abc.zip && mv abc/* .
    CMD nginxctl -DFOREGROUND

    -----Build Now-------
    docker build -t custom_ngnix -f DockerFile .

### Metadata

`Label` can be used to specify metadata

    FROM ubuntu
    RUN apt install nginx
    LABEL Maintainer=Thirumal
    LABEL Vendor=ABC

### Argument

`ARG` can be used as a build time argument

    FROM ubuntu
    ARG software=nginx
    RUN apt install $software

    ------------
    docker build -t custom_ngnix -f DockerFile --build-arg software = vlc .

More than one argument

    FROM ubuntu
    ARG software=nginx
    ARG user
    # Add NEW user from argument
    RUN adduser $user
    # Switch to the NEW user
    USER $user
    RUN apt install $software

    ------------
    docker build -t custom_ngnix -f DockerFile --build-arg software = vlc .

## Docker Ignore
Docker ignore `.dockerignore` can be used to ignore the unneccessary files while building the docker images

    `vi .dockerignore`

Add all the folders & files that you would like to ignore, just like `.gitignore`