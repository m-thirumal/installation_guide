# Run JanusGraph on  different port

1. Change `PORT` in `janusgraph-1.0.0-rc2/conf/gremlin-server/gremlin-server-cql.yaml`

```bash
host: 0.0.0.0
port: 8183
evaluationTimeout: 30000
channelizer: org.apache.tinkerpop.gremlin.server.channel.WebSocketChannelizer
graphManager: org.janusgraph.graphdb.management.JanusGraphManager
graphs: {
  graph: conf/janusgraph-cql.properties
}
```

Also, change in the following files to connect via gremlin console

1. remote-graph-binary.yaml
2. remote-graph.properties
3. remote-objects.yaml
4. remote.yaml

To Change cassandra keystore check [Change Keystore](Change%20Keystore.md)
