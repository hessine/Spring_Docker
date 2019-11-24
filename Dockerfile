  
FROM openjdk:8
EXPOSE 8080
ADD target/reservation-service-0.0.1-SNAPSHOT.jar reservation-service-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/reservation-service-0.0.1-SNAPSHOT.jar"]