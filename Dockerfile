FROM registry.access.redhat.com/ubi8/openjdk-11:latest

#maintainer
MAINTAINER yannipeng@google.com
#expose port 8080
COPY ./target/rabbitmq-tutorials.jar /opt/app-root/rabbit-sender.jar
USER 1001
#default command
CMD java -jar /opt/app-root/rabbit-sender.jar --spring.profiles.active=routing,sender

#copy hello world to docker image from builder image
