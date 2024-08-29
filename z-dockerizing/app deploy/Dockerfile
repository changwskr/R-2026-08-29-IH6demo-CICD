# Tomcat 베이스 이미지 사용
#FROM tomcat:9.0
# 호스트의 볼룸 설정
#VOLUME /temp
# WAR 파일을 Tomcat의 webapps 디렉토리에 복사
#COPY IH5demo-2024-08-02-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
# Tomcat의 기본 포트
#EXPOSE 8081

# ------------------------------------------
# 다음의 버전으로 하니 정상 작동한다. war는 잘안되네
# ------------------------------------------
FROM openjdk:18
ARG JAR_FILE=*.jar
COPY ${JAR_FILE} app.jar

VOLUME /Temp2
COPY ${JAR_FILE} /Temp2/app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

