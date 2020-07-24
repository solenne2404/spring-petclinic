FROM openjdk:8-jre-alpine
ADD target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "/app.jar"]
