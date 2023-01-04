### Cassandra Storage Backend

Change the follwoing line in `janusgraph-server.sh`

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


To Drop janus database, drop the keyspace.