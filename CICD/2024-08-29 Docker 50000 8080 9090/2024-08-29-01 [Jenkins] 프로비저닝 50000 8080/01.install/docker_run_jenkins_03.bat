rem "container name은 jenkins-server"
docker run -d -p 8080:8080 -p 50000:50000 ^
        --name jenkins-server ^
        --restart=on-failure ^
        -v c:\Work\dockerdata\plugins:/var/jenkins_home/plugins ^
        jenkins/jenkins:lts-jdk11

docker ps -a | findstr jenkins
