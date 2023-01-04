## Installation of JanusGraph database

### Dependencies

* OpenJdk 11
* [Cassandra](../Cassandra/Installation.md) (Used in this tutorial, can use other backend storage)

### Running JanusGraph 

* Download the JanusGraph and create new linux user 'janus' and unzip the download to `/opt` and give ownership to `janus` user

* By default, the janus will work with inmemory, use link:../Cassandra/Installation.adoc[Cassandra]


### Running JanusGraph inside a Docker container

```
docker run -it -p 8182:8182 janusgraph/janusgraph
```

### Connect using Gremlin Console

Download apache gremlin console and run the following commands to connect 

```
$ cd janusgraph-X.x.x
$ bin/gremlin.sh

        \,,,/
        (o o)
-----oOOo-(3)-oOOo-----
09:12:24 INFO  org.apache.tinkerpop.gremlin.hadoop.structure.HadoopGraph  - HADOOP_GREMLIN_LIBS is set to: /usr/local/janusgraph/lib
plugin activated: tinkerpop.hadoop
plugin activated: janusgraph.imports
gremlin> :remote connect tinkerpop.server conf/remote.yaml
##>Configured localhost/127.0.0.1:8182
gremlin> :remote console
##>All scripts will now be sent to Gremlin Server - [localhost/127.0.0.1:8182] - type ':remote console' to return to local mode
gremlin> g.V().count()
```

