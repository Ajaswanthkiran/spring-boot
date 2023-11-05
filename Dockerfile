FROM maven:3.8.5-openjdk-17 as build
COPY OBS .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.2-jdk-slim
COPY --from=build /target/OBS-0.0.1-SNAPSHOT.jar OBS.jar
EXPOSE 9000
ENTRYPOINT ["java","-jar","OBS.jar"]
