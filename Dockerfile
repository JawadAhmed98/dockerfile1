FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get install -y wget && \
    apt-get clean

# Use an OpenJDK base image
FROM openjdk:11-jre-slim


# Install wget
RUN apt-get update && apt-get install -y wget

# Download and extract Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.86/bin/apache-tomcat-9.0.86.tar.gz

RUN tar -xvf apache-tomcat-9.0.86.tar.gz
COPY /Amazon/Amazon/Amazon-Web/target/Amazon.war /apache-tomcat-9.0.86/webapps
WORKDIR /apache-tomcat-9.0.86/bin
CMD ["sh","startup.sh"]
# Expose ports
EXPOSE 8080
#navigations
