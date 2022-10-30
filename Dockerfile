FROM maven:3.5.2-jdk-8 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM thothbot/alpine-jre8
COPY --from=build /usr/src/app/src/target/myproject-0.0.1-SNAPSHOT.jar /myproject-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/myproject-0.0.1-SNAPSHOT.jar"]
