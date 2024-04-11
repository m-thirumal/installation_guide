# Build PgModeler from source => Ubuntu

#### Installing libraries (Dependencies)

```bash
 sudo apt-get install build-essential
 sudo apt-get install git
 sudo apt-get install qtcreator
 sudo apt-get install qt6-base-dev 
 sudo apt-get install qt5-qmake
 sudo apt-get install libpq5
 sudo apt-get install libxml2
 sudo apt-get install pkg-config
 sudo apt-get install xml2
 sudo apt-get install libxml2-dev
 sudo apt-get install libpq-dev
 sudo apt-get install libqt5svg5-dev
 sudo apt-get install libqt6svg6*
 sudo apt-get install libxext-dev
```

or install all dependencies in one command line

```bash
sudo apt-get install build-essential git qtcreator qt6-base-dev qt5-qmake libpq5 libxml2 pkg-config xml2 libxml2-dev libpq-dev libqt5svg5-dev qmake6 libqt6svg6* libxext-dev
```

#### Make qt6 default in system for current user (since 1.0.2 qmake6 - REQUIERED)

```shell
qtchooser -install $(which qmake6)
export QT_SELECT=qt6
```

#### Getting the source

Clone the PgModeler from github [https://github.com/pgmodeler/pgmodeler.git](https://github.com/pgmodeler/pgmodeler.git)

```bash
git clone https://github.com/pgmodeler/pgmodeler.git
cd pgmodeler
```

#### Build the application

Once everything is prepared, you can compile and install pgmodeler using the following commands

```bash
qmake pgmodeler.pro
make
sudo make install
```

The binary will be available in */usr/local/bin/*

#### Open PgModeler

Just type the below command in terminal

```bash
pgmodeler
```

Tested with Ubuntu-20.04
Enjoy !!!

![output](Ubuntu.png)
