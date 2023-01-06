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

### View the Graph Data Saved In Cassandra

Switch to the `cassandra` user. And run `cqlsh` which is a Cassandra client. Note that you will need to install Python if it is not already installed.

```
su cassandra
/opt/apache-cassandra-X.xx.x/bin/cqlsh
```


Get the list of keyspaces.

```
./cqlsh

cqlsh> DESCRIBE KEYSPACES;

system_schema  system      system_distributed
system_auth    janusgraph  system_traces
```

You see that JanusGraph created a keyspace “janusgraph”. Let’s use this keyspace and get the list of tables under it.

```
cqlsh> USE janusgraph;

cqlsh:janusgraph> DESCRIBE TABLES;

edgestore_lock_  graphindex_lock_         janusgraph_ids
txlog            systemlog                graphindex
edgestore        system_properties_lock_  system_properties
```

The most important table is “edgestore”. This is where all the graph data (vertices, edges and properties) are stored. So let’s view this table data.

```

cqlsh: janusgraph> SELECT * FROM edgestore;

 key                | column1            | value
--------------------+--------------------+----------------------------
 0x0000000000000c15 |               0x02 |                 0x00015480
 0x0000000000000c15 |             0x10c0 |   0xa072741e6b6e6f77ee5080
 0x0000000000000c15 |       0x10c2806400 |           0x8f00018e008080
 0x0000000000000c15 |       0x10c2806800 |           0x9981018e008180
 0x0000000000000c15 |       0x10c2806c00 |           0xad80018e008280
 0x0000000000000c15 |       0x10c2807000 |           0x9981018e008380
 0x0000000000000c15 |       0x10c2807400 |           0xae80018e008480`
 0x0000000000000c15 |       0x10c2807800 |           0xb082018e008680
 0x0000000000000c15 |       0x10c2807c00 |           0xb382018e008780
 0x0000000000000c15 |             0x10c4 |                 0x00805880
 0x0000000000000c15 |             0x10c8 |   0x008005b873e162aaf86080
 0x4000000000000080 |               0x02 |                 0x00010488
 0x4000000000000080 |               0x24 |               0x048d0888ff
 0x4000000000000080 |             0x50c0 |               0xa070b10c88

 ```


### To Drop janus database, drop the keyspace.
