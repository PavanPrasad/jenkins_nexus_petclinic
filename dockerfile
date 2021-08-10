FROM maven:3.5.4-jdk-8-alpine as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
FROM openjdk:8u171-jre-alpine
EXPOSE 8070
WORKDIR /pavan1stproject/
COPY /pavan1stproject/target/spring-petclinic-2.4.5.jar ./spring-petclinic-2.4.5.jar
CMD ["/usr/bin/java", "-jar", "./spring-petclinic-2.4.5.jar", "--server.port=8070"]

