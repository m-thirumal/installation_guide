## The JanusGraph management API

Using management API, we can define the following,

* Edge, 
* Vertex 
* Property schema types 
* Index.


### <u>Manage by Gremlin</u>
Connect to gremlin and open session

```
 ./gremlin.sh 



:remote connect tinkerpop.server conf/remote.yaml session

:remote console

mgmt = graph.openManagement()

# mgmt.commit()
```

### Print Schema

    mgmt.printSchema()

### <u>Define Vertex schema</u>

List all vertex label

    mgmt.getVertexLabels()

List all edge label

    mgmt.getRelationTypes(EdgeLabel.class)

List all properties key

    mgmt.getRelationTypes(PropertyKey.class)

Cardinality of a property

    mgmt.getPropertyKey('name').cardinality()
    ==>SINGLE

Data type of property

    gremlin> mgmt.getPropertyKey('name').dataType()
    ==>class java.lang.String

Existence of a label

    mgmt.containsEdgeLabel('route')
    true

    mgmt.containsVertexLabel('user')
    true

## <u>Creating Vertex Label</u>

```
mgmt.makeVertexLabel('user').make()
mgmt.commit()
```

## <u>Defining edge labels and usage</u>

Allowed usages are 

* MULTI - default 
* MANY2ONE
* ONE2MANY
* ONE2ONE 
* SIMPLE

```
mgmt.makeEdgeLabel('contains').multiplicity(SIMPLE).make()
mgmt.commit()
```

## <u>Creating a property with cardinality</u>

Allowed cardinalities are 

* SINGLE - default
* LIST
* SET

```
mgmt.makePropertyKey('name').dataType(String.class).cardinality(LIST).make()
mgmt.commit()
```

###<u>Display the property keys along with their data types and cardinality settings</u>

```
types = mgmt.getRelationTypes(PropertyKey.class)
types.each{println "$it\t: " + mgmt.getPropertyKey("$it").dataType() + " " + mgmt.getPropertyKey("$it").cardinality()}
```
