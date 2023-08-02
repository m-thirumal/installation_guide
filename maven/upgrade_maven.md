# Upgrade Maven in Ubuntu

Download, unzip  and copy the latest version of maven to `/usr/local/`
```bash
wget https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz
sudo mkdir -p /usr/local/apache-maven
sudo mv apache-maven-3.9.3-bin.tar.gz /usr/local/apache-maven
cd /usr/local/apache-maven
sudo tar -xzvf apache-maven-3.9.3-bin.tar.gz 
```

Then, edit `~/.profile` with `sudo vi ~/.profile` and add these four lines:   
```bash
export M2_HOME=/usr/local/apache-maven/apache-maven-3.9.3
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2:$PATH 
```
then, execute ` ~/.profile`

```bash
source ~/.profile
```

Check the version

```bash
mvn --version
```
