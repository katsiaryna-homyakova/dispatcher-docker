# dispatcher-docker

### Build

```
docker build -t dispatcher . 
```

### Run

```
 docker run -dit --name dispatcher-app -p 80:80 dispatcher
```

Known issue: https://github.com/docker/for-win/issues/12673. 
"After a period of time the host.docker.internal can't be resolved anymore."