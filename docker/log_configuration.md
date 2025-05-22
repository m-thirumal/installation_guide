## Docker Log management

## Run/Create docker container without log

```shell
docker run --name {container_name} --log-driver none -d -p {PORT}:{PORT} {image_name}
```

##  Run/Create docker container local log


```shell
docker run --name {container_name} --log-driver local --log-opt max-size=10m --log-opt max-file=3  --log-opt compress=true -d -p {PORT}:{PORT} {image_name}
```

## Options
The local logging driver supports the following logging options:

[cols="1,1,1"]
|===
|Option | Description | 	Example value
|max-size| The maximum size of the log before it is rolled. A positive integer plus a modifier representing the unit of measure (k, m, or g). Defaults to 20m.|	--log-opt max-size=10m
|max-file |	The maximum number of log files that can be present. If rolling the logs creates excess files, the oldest file is removed. A positive integer. Defaults to 5.| --log-opt max-file=3
| compress |Toggle compression of rotated log files. Enabled by default.|--log-opt compress=false
|===