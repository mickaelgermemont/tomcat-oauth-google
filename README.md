# Hello

## requirement

- Google API access credentials (Client ID, Client Secret). Set it up here https://code.google.com/apis/console/
- Enable the Google+ API
- Set up allowed Redirect URIs at Google API -> API Access. Input: https://localhost:8843/google-oauth-example/index.jsp
- read https://developers.google.com/+/web/signin/
- read https://developers.google.com/identity/sign-in/web/
- read https://developers.google.com/api-client-library/java/google-oauth-java-client/oauth2
- read https://developers.google.com/+/web/api/rest/oauth

## build docker image

```
cd dev-local/google-oauth-example ; mvn clean package ; cd ../..
docker build -t tomcat-oauth-google .
```

## start app

```
docker run --rm -p 8843:8843 --name tomcat_oauth_google tomcat-oauth-google
```

open browser at https://localhost:8843/google-oauth-example

## start container and use command-line

```
docker run --rm -it tomcat-oauth-google bash
```

## connect to running container

```
docker exec -it tomcat_oauth_google /bin/bash
```
