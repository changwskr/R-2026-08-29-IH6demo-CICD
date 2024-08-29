docker pull tomcat:9.0
docker run -d -p 8088:8080 -e TZ=Asia/Seou --name my-tomcat tomcat
#docker run --name my-tomcat -p 8080:8080 -e TZ=Asia/Seoul tomcat:9.0
