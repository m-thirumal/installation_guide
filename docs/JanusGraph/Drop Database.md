### <u>Connect to Gremlin Console</u>
Connect to gremlin and open session

```bash
 ./gremlin.sh 

:remote connect tinkerpop.server conf/remote.yaml session

:remote console

```

### <u>Drop database</u>

Give proper properties file to drop

```bash
gremlin> graph = JanusGraphFactory.open('/opt/janusgraph-1.0.0-rc1/conf/janusgraph-cql.properties')
==>standardjanusgraph[cql:[127.0.0.1]]
gremlin> JanusGraphFactory.drop(graph);
```