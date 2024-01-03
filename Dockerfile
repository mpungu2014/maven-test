# Pull base image 
FROM tomcat:8-jre8 

# Maintainer 
MAINTAINER "mpungu_a@yahoo.fr"
COPY ./target/webapp.war /usr/local/tomcat/webapps
