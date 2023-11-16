# Gremlin client / Visualization Tool

1. [AWS Graph Notebook](https://github.com/aws/graph-notebook)


## AWS Graph Notebook

Follow the instructions provided in the README, once the notebook launched in browser, enter the following config and execute

Janus Graph configuration
```
%%graph_notebook_config
{
  "host": "65.1.8.253",
  "port": 8182,
  "ssl": false,
  "gremlin": {
    "traversal_source": "g",
    "message_serializer": "graphbinaryv1"
  }
}
```

OR

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
