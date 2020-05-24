# Build PgModeler from source

#### Installing libraries (Dependencies)

```
 1.  sudo apt-get install build-essential
 2.  sudo apt-get install git
 3.  sudo apt-get install qt5-default 
 4.  sudo apt-get install qt5-qmake
 5.  sudo apt-get install libpq5
 6.  sudo apt-get install libxml2
 7.  sudo apt-get install pkg-config
 8.  sudo apt-get install xml2
 9.  sudo apt-get install libxml2-dev
 10. sudo apt-get install libpq-dev
 11. sudo apt-get install libqt5svg5-dev
```

or install all dependencies in one command line

```
sudo apt-get install build-essential git qt5-default qt5-qmake libpq5 libxml2 pkg-config xml2 libxml2-dev libpq-dev libqt5svg5-dev
```

#### Getting the source

Clone the PgModeler from github [https://github.com/pgmodeler/pgmodeler.git](https://github.com/pgmodeler/pgmodeler.git)

```
git clone https://github.com/pgmodeler/pgmodeler.git
cd pgmodeler
```


#### Build the application

Once everything is prepared, you can compile and install pgmodeler using the following commands

```
qmake pgmodeler.pro
make
sudo make install
```

The binary will be available in */usr/local/bin/*
