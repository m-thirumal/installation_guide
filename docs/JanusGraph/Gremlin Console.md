## Connect using Gremlin Console

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
```

<u>To connect to remote server :-</u>

```
gremlin> :remote connect tinkerpop.server conf/remote.yaml

##>Configured localhost/127.0.0.1:8182
gremlin> :remote console

##>All scripts will now be sent to Gremlin Server - [localhost/127.0.0.1:8182] - type ':remote console' to return to local mode

gremlin> g.V().count()

gremlin> graph

gremlin> g

```

