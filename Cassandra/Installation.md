## Installation of Cassandra

* Download the Cassandra and untar the installation files to `/opt`.

```bash
cd /opt
wget https://dlcdn.apache.org/cassandra/4.1.2/apache-cassandra-4.1.2-bin.tar.gz
tar -xf apache-cassandra-4.1.2-bin.tar.gz
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
