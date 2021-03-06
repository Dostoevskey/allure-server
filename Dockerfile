FROM gradle:jdk11 as build
COPY . .
RUN gradle -Pversion=docker --no-daemon bootJar

FROM openjdk:11-jre-slim as production
COPY --from=build /home/gradle/build/libs/allure-server-docker.jar /allure-server-docker.jar
# Set port
EXPOSE 8080
# Run application
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=${PROFILE:-default}","/allure-server-docker.jar"]