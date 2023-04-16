## Import base image
FROM tomcat:9.0

## copy war to the webapps folder
COPY target/*.war /usr/local/tomcat/webapps/tomcat-webapp-app.war
