# Configuration

## To increase RAM

Go to `/opt/apache-cassandra-4.1.1/conf/cassandra-env.sh` and locate the following variables

```bash
MAX_HEAP_SIZE="8G"
HEAP_NEWSIZE="2G"
```
Uncomment the above settings and change the desired value
