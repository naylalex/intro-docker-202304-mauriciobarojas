FROM ubuntu as builder

WORKDIR /usr/src/words
COPY ./src ./src
COPY pom.xml ./
RUN apt-get update -y && apt-get install -y maven openjdk-8-jdk && mvn verify


FROM amazoncorretto  
WORKDIR /usr/src/words
COPY --from=builder /usr/src/words .
CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "target/words.jar"]
EXPOSE 8080

