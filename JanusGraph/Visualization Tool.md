# Gremlin client / Visualization Tool

1. Gotv
2. [AWS Graph Notebook](https://github.com/aws/graph-notebook)


## AWS Graph Notebook

Janus Graph configuration

```
%%graph_notebook_config
{
  "host": "localhost",
  "port": 8182,
  "ssl": false,
  "gremlin": {
    "traversal_source": "g",
      "username": "",
    "password": "",
    "message_serializer": "graphsonv3"
  }
}
```