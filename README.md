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

first started with https://github.com/docker-library/tomcat
thats in Dockerfile.2
but finally i will use FROM tomcat:9.0.11-jre10
thats in Dockerfile

docker run -it --rm tomcat:9.0.11-jre10

## failing command in https://github.com/docker-library/tomcat version 9
following two commands dont work

```
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 05AB33110949707C93A279E3D3EFE6B686867BA6
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 07E48665A34DCAFAE522E5E6266191C37C037D42
```

following two commands work

```
gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 05AB33110949707C93A279E3D3EFE6B686867BA6
gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 07E48665A34DCAFAE522E5E6266191C37C037D42
```

so i changed the Dockerfile
```
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key"; \
```
