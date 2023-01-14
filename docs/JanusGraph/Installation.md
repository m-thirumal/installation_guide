## Installation of JanusGraph database

### Dependencies

* OpenJdk 11 [Refer Guide](../Java/Installation.md)
* [Cassandra](../Cassandra/Installation.md) (Used in this tutorial, can use other backend storage)

### Download & Setup JanusGraph 

* Download the JanusGraph and create new linux user 'janus' and unzip the download to `/opt` and give ownership to `janus` user

```
cd /opt
adduser janus
chown -R janus:janus janusgraph-X.xx.x
```

* By default, the janus will work with inmemory, use [Cassandra](../Cassandra/Installation.adoc)

### <u>Run :-</u>
Edit `/opt/janusgraph-1.0.0-rc1/bin/janusgraph-server.sh` file, and set `gremlin-server/gremlin-server-cql.yaml` value to 

```
useGremlinServerConfiguration(){
    if [[ -n "$1" ]] ; then
      setValidConfiguration "$1"
    elif [[ -z "$JANUSGRAPH_YAML" ]]; then
      setValidConfiguration "gremlin-server/gremlin-server-cql.yaml"
    elif [[ -r "$JANUSGRAPH_YAML" ]]; then
      setValidConfiguration "$JANUSGRAPH_YAML"
    fi
}
```

Then, to start

```
./janusgraph-server.sh start
```
and to stop
```
./janusgraph-server.sh stop
```
to restart
```
./janusgraph-server.sh restart
```


### Running JanusGraph inside a Docker container

```
docker run -it -p 8182:8182 janusgraph/janusgraph
```

