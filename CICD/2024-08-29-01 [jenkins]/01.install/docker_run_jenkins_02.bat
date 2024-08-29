rem "container name은 jenkins-server"
docker run -d -p 8080:8080 -p 50000:50000 ^
        --name jenkins-server ^
        --restart=on-failure ^
        jenkins/jenkins:lts-jdk11

docker ps -a | findstr jenkins
