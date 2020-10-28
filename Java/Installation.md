# Java JDK installation

### OpenJdk Installation on Ubuntu using PPA

    sudo add-apt-repository ppa:openjdk-r/ppa
    
    sudo apt update

    sudo apt install openjdk-{version}-jdk

### OpenJdk installation on Mac OSX

Download the latest version of [Java](https://jdk.java.net/15/) & unzip.

Move the unziped `directory` to `java virtual machine`

    sudo mv jdk-11.jdk /Library/Java/JavaVirtualMachines/


Check the version
    
    `java -version`


### OpenJdk Installation on Ubuntu by downloading

Download the latest version of [Java](https://jdk.java.net/15/) & unzip.

Move the unziped `directory` to `java virtual machine`

    sudo tar xfvz openjdk-11.0.1_linux-x64_bin.tar.gz --directory /usr/lib/jvm

Change the default version of `Java`

    sudo update-alternatives --install /usr/bin/java java 
    /usr/lib/jvm/jdk-11.0.1/bin/java 1
    sudo update-alternatives --install /usr/bin/javac javac
    /usr/lib/jvm/jdk-11.0.1/bin/javac 1