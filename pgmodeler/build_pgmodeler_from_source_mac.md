#### Build pgmodeler from the source for MAC

#### Clone

`git clone https://github.com/pgmodeler/pgmodeler.git`

`cd pgmodeler`

#### Build

1. Install PostgreSQL
2. Install Xcode
3. Install libxml2, qt & libpq

```
brew install qt libxml2 libpq
```

And change the installation path in 'pgmodeler.pri', something similar to the following configuration
```
macx {
  PGSQL_LIB = /Applications/Postgres.app/Contents/Versions/12/lib/libpq.dylib
  PGSQL_INC = /Applications/Postgres.app/Contents/Versions/12/include
  XML_INC = /usr/local/Cellar/libxml2/2.9.10_1/include/libxml2
  XML_LIB = /usr/local/Cellar/libxml2/2.9.10_1/lib/libxml2.dylib
  INCLUDEPATH += $$PGSQL_INC $$XML_INC
}
```
then, run the below command to build

`/usr/local/opt/qt/bin/qmake -r pgmodeler.pro`

#### Install

Run the below command to install pgModeler in '/Application'

`make && make install`

Go to application and select pgmodeler

Enjoy !!!

![output](mac-pgmodeler.png)
