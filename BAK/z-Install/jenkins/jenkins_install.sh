docker rm -f `docker ps -a -q`
docker login
docker pull jenkins
docker run -d -p 8080:8080 -v /home/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -u root jenkins/jenkins
docker ps -a | grep jenkins
