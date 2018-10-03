#see https://github.com/docker-library/tomcat/blob/master/9.0/jre10-slim/Dockerfile

FROM tomcat:9.0.11-jre10

RUN keytool -genkey -noprompt \
 -alias tomcat \
 -keyalg RSA \
 -dname "CN=helloworld, OU=ID, O=ON, L=OAuthSample, S=WithTomcat, C=US" \
 -keystore /usr/local/tomcat/.keystore \
 -storepass "ebx tomcat password" \
 -keypass "ebx tomcat password"

COPY dev-local/google-oauth-example/target/google-oauth-example.war /usr/local/tomcat/webapps/
COPY server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 8080
CMD ["catalina.sh", "run"]
