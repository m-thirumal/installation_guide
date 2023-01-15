## Install Redis Server in Ubuntu

```
sudo apt-get install redis-server
```

#### To Check the status

```
ps aux | grep redis
```

#### To start redis server

```
nohup redis-server &
```

## Mac installlation & Configuration:

```
$ mkdir redis && cd redis
$ curl -O http://download.redis.io/redis-stable.tar.gz
$ tar xzvf redis-stable.tar.gz
$ cd redis-stable
$ make
$ make test
$ sudo make install
```

### To Start redis server

```
redis-server
```
