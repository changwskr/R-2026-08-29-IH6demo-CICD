#FROM openjdk:8-jdk-alpine
#RUN  apk update && apk upgrade && apk add netcat-openbsd
#RUN mkdir -p /usr/local/simple-service
#ADD @project.build.finalName@.jar /usr/local/simple-service/
#ADD run.sh run.sh
#RUN chmod +x run.sh
#CMD ./run.sh


#FROM openjdk:17-jdk-alpine
#WORKDIR /app
#COPY --from=build target/IH6demo-2025-08-03-0.0.1-SNAPSHOT.jar /app/IH6demo-2025-08-03-0.0.1-SNAPSHOT.jar
#EXPOSE 8080
#ENTRYPOINT ["java", "-jar", "/app/IH6demo-2025-08-03-0.0.1-SNAPSHOT.jar"]

FROM openjdk:18
ARG JAR_FILE=*.jar
COPY ${JAR_FILE} app.jar

VOLUME /Temp2
COPY ${JAR_FILE} /Temp2/app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]