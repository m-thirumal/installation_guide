# Installing Jenkins on Ubuntu

* [Direct Install](#Direct-Install)
* [Docker Install](#Using-Docker)


# Direct Install

### Prerequist  to install on OS directly

Requires `JAVA`,

```bash
sudo apt update
sudo apt install openjdk-11-jre
java -version
openjdk version "11.0.12" 2021-07-20
OpenJDK Runtime Environment (build 11.0.12+7-post-Debian-2)
OpenJDK 64-Bit Server VM (build 11.0.12+7-post-Debian-2, mixed mode, sharing)
```

Use the following commands to install jenkins

```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```



To get admin password, enter the following commands

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

# Using Docker

* To install latest LTS
    
    `docker pull jenkins/jenkins:lts`
   
* To install latest weekly version

    `docker pull jenkins/jenkins`
    
* To Run the jenkins in docker

    `docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts`
    
    to run in background with bind volume
    
    `sudo docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins`
   
* Copy the password from the terminal/`/var/lib/docker/volumes/jenkins_home/_data/secrets/initialAdminPassword` and paste it in browser and set the admin account
    
    [http://localhost:8080](http://localhost:8080)
    
  