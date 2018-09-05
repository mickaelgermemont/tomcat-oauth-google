# Hello

## build docker image

```
cd dev-local/google-oauth-example ; mvn clean package ; cd ../..
docker build -t tomcat-oauth-google .
```

## start app

```
docker run -p 8843:8843 tomcat-oauth-google
```

open browser at https://localhost:8843/google-oauth-example

## debug docker image

```
docker run -it tomcat-oauth-google bash
```

```
docker ps # find your container name
docker exec -it goofy_hopper /bin/bash
```
