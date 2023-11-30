## Indexing

Indices reduce latency on Gremlin graph queries, especially if the databases contain large data sets.

Vertex-centric searches on indexed vertices show extremely low latency, and typically return within a few seconds even in the presence of large data sets. 

Composite indices should be defined ahead of time (prior to loading data) or a re-index should occur if you are defining the indices after loading data.


The JanusGraph documentation recommends the use of the configuration property query.force-index to require the use of indexes in searches.

In the absence of an index, JanusGraph will default to a full graph scan in order to retrieve the desired list of vertices. While this produces the correct result set, the graph scan can be very inefficient and lead to poor overall system performance in a production environment and in the worst case lead to system failure. 

### <u>Procedure</u>

1. Add the following properties to `janusgraph-1.0.0/conf/janusgraph-cql.properties`

```bash
force-index=true
```

2. Then, follow the janusgraph documentation

```bash
graph.tx().rollback() //Never create new indexes while a transaction is active
mgmt = graph.openManagement()
name = mgmt.getPropertyKey('name')
age = mgmt.getPropertyKey('age')
mgmt.buildIndex('byNameComposite', Vertex.class).addKey(name).buildCompositeIndex()
mgmt.buildIndex('byNameAndAgeComposite', Vertex.class).addKey(name).addKey(age).buildCompositeIndex()
mgmt.commit()
//Wait for the index to become available
ManagementSystem.awaitGraphIndexStatus(graph, 'byNameComposite').call()
ManagementSystem.awaitGraphIndexStatus(graph, 'byNameAndAgeComposite').call()
//Reindex the existing data
mgmt = graph.openManagement()
mgmt.updateIndex(mgmt.getGraphIndex("byNameComposite"), SchemaAction.REINDEX).get()
mgmt.updateIndex(mgmt.getGraphIndex("byNameAndAgeComposite"), SchemaAction.REINDEX).get()
mgmt.commit()
```

3. To check/test, use `.profile()`

```bash
gremlin> g.V().hasLabel('user').has('name','Thirumal').elementMap().profile()
==>Traversal Metrics
Step                                                               Count  Traversers       Time (ms)    % Dur
=============================================================================================================
JanusGraphStep([],[~label.eq(user), name.eq(Thi...                     1           1           5.427    47.58
  constructGraphCentricQuery                                                                   1.543
  GraphCentricQuery                                                                            8.695
    \_condition=(~label = user AND name = Thirumal)
    \_orders=[]
    \_isFitted=false
    \_isOrdered=true
    \_query=multiKSQ[1]
    \_index=byNameComposite
ElementMapStep                                                         1           1           5.979    52.42
                                            >TOTAL                     -           -          11.406        -
```