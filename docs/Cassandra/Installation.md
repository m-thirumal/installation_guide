## Installation of Cassandra

* Download the Cassandra and untar the installation files to `/opt`.

```bash
cd /opt
wget http://archive.apache.org/dist/cassandra/X.xx.x/apache-cassandra-3.11.0-bin.tar.gz
tar -xf apache-cassandra-3.11.0-bin.tar.gz
```

* Create new linux user `cassandra` and give ownership to `cassandra` user 

```bash
adduser cassandra
chown -R cassandra:cassandra apache-cassandra-X.xx.x
```

* Go to bin folder and run the following command to 

```bash
./cassandra -f
or 
./cassandra
```
