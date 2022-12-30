# Java JDK installation

### OpenJdk Installation on Ubuntu using PPA

    sudo add-apt-repository ppa:openjdk-r/ppa
    
    sudo apt update

    sudo apt install openjdk-{version}-jdk

### OpenJdk installation on Mac OSX

Download the latest version of [Java](https://jdk.java.net/18/) & unzip.

Move the unziped `directory` to `java virtual machine`

    sudo mv jdk-11.jdk /Library/Java/JavaVirtualMachines/
    
OR Copy 

    sudo tar xvzf openjdk-18_macos-aarch64_bin.tar.gz -C /Library/Java/JavaVirtualMachines


Check the version
    
    java -version


### OpenJdk Installation on Ubuntu by downloading

Download the latest version of [Java](https://jdk.java.net/15/) & unzip.

Move the unziped `directory` to `java virtual machine`

    sudo tar xfvz openjdk-11.0.1_linux-x64_bin.tar.gz --directory /usr/lib/jvm

#### Change the default version of `Java`

Check the availavle version of jdk and select the desired version

    sudo update-alternatives --config java

Then, enter the number you want to switch

    [sudo] password for thirumal: 
    There are 2 choices for the alternative java (providing /usr/bin/java).

    Selection    Path                                         Priority   Status
    ------------------------------------------------------------
    * 0            /usr/lib/jvm/java-14-openjdk-amd64/bin/java   1411      auto mode
    1            /usr/lib/jvm/java-14-openjdk-amd64/bin/java   1411      manual mode
    2            /usr/lib/jvm/jdk-15.0.1/bin/java              1         manual mode

    Press <enter> to keep the current choice[*], or type selection number: 2


    update-alternatives: using /usr/lib/jvm/jdk-15.0.1/bin/java to provide /usr/bin/java (java) in manual mode

Check the version

    java -version

#### The same can be done using `Javac`

    sudo  update-alternatives --config javac


#### Alternative

    sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-15.0.1/bin/java 1
    sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-15.0.1/bin/javac 1
