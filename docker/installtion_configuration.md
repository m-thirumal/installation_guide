### Installation

    sudo apt install docker-ce docker-ce-cli containerd.io
    sudo apt install docker.io    

### Enable Auto start

    `sudo systemctl enable docker`

#### Add user into docker group

    sudo usermod -aG docker thirumal

#### Logs

    docker logs {container name/id

#### Move docker folders/images to custom location

Open `sudo vi /lib/systemd/system/docker.service` and add the below argument to `ExecStart`

    --data-root /opt/docker

And move docker folder

    `mv /var/lib/docker /opt`
