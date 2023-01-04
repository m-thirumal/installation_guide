# To fix Vertex does not support user supplied identifiers
Set the following property in `conf/janusgraph-cql.properties`

```
graph.set-vertex-id=true
```