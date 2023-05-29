# Schema and Indexing.

## How to create in file.

1. Create groovy file Eg: `schema.groovy`, then create function eg:

```groovy
def defineSchema(graph) {
    graph.tx().rollback()
    mgmt = graph.openManagement()
    // Vertex Schema
    if (!mgmt.containsPropertyKey("name")) mgmt.makePropertyKey("name").dataType(String.class).cardinality(org.apache.tinkerpop.gremlin.structure.VertexProperty.Cardinality.single).make()
    // Edge  Schema
    if (!mgmt.containsPropertyKey("role")) mgmt.makePropertyKey("role").dataType(String.class).cardinality(org.apache.tinkerpop.gremlin.structure.VertexProperty.Cardinality.single).make()
    name = mgmt.getPropertyKey("name")
    // Vertex Indices
    mgmt.buildIndex("byName", Vertex.class).addKey(name).buildCompositeIndex()
    // Edge Indices
    hasRole = mgmt.getEdgeLabel('has_role')
    mgmt.buildEdgeIndex(hasRole, 'hasRoleByEndTime', Direction.BOTH, endTime)
    //Commit    
    mgmt.commit()
}
```

# Load and execute schema & Indcies

1. Login in to gremlin console

```bash
./gremlin.sh
```

2. Connect to database with session

```bash
:remote connect tinkerpop.server conf/remote.yaml session
:remote console
```

3. Load & Define Schema

Before load, make sure the file is upload to janus user accessible location. Eg `/home/janus/schema.groovy`

Load:

```bash
:load /home/janus/schema.groovy
```

Define:

```bash
defineSchema(graph)
mgmt=graph.openManagement()
mgmt.printSchema()
mgmt.commit()
```


