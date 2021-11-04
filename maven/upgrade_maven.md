# Upgrade Maven in Ubuntu

    wget https://dlcdn.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz
    sudo mkdir -p /usr/local/apache-maven
    sudo mv apache-maven-3.8.3-bin.tar.gz /usr/local/apache-maven
    cd /usr/local/apache-maven
    sudo tar -xzvf apache-maven-3.8.3-bin.tar.gz 

Edit `~/.profile` with `sudo vi ~/.profile` and add these four lines:   

    export M2_HOME=/usr/local/apache-maven/apache-maven-3.8.3
    export M2=$M2_HOME/bin
    export MAVEN_OPTS="-Xms256m -Xmx512m"
    export PATH=$M2:$PATH          

then, execute ` ~/.profile`

    source ~/.profile

Check the version

    mvn --version