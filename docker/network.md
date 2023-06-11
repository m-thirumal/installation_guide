# Types of Network
 * Bridge Network - `default network`
 * Host Network
 * None Network

#### List Docker network

    docker network ls

#### Run docker with host network

    docker --net=host 

### Inspecting a Docker network

    docker network inspect networkname

    docker network inspect bridge
