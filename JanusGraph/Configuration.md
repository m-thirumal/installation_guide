# Configuration

## Increase RAM

Go to `/opt/janusgraph-1.0.0/conf/jvm-11.options` and locate the following lines

```bash
-Xms4096m
-Xmx4096m
```

Increate the size and restart