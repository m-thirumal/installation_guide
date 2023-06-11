# From where the docker image getting build

If the given DockerFile directory contains any files /folder it will also get added to the image

### How to avoid?

Use `.dockerignore` file to add all un-neccessary files/folders. This works exactly same as `.gitignore`

### Dangling images

Dockers are read-only, that means when you create a image with same name, previous version of image will become `<none>`

#### List all dangling images

    docker images -f dangling=true -q

#### Delete all dangling images

    docker rmi $(docker images -f dangling=true -q)

#### Multi-Stage image

To reduce the size of images

    FROM maven:3.6-alpine as builder

    COPY java-repo /java-repo

    WORKDIR /java-repo

    RUN maven package

    FROM openjdk:11-alpine

    COPY --from=builder /java-repo/target/java-repo-1.0-SNAPSHOT.jar /java-repo.jar

    CMD java -jar /java-repo.jar

In the above `DockerFile`, `Maven` image is dicarded and used only `JDK-alpine` to build the image
