# guide
# https://docs.google.com/document/d/1i9w7UQImTS0u14egFc6DrXsq7UuSeCvEM2dWpWcEE58/edit
docker login
docker pull jenkins/jenkins
docker run -d -p 8080:8080 -v /home/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -u root jenkins/jenkins
docker run -d -p 8080:8080 -v /home/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -u root changwskr/roian_jenkins:1.0
vid=`docker ps -a | grep jenkins | awk '{print $1}'`

#jenkin에 docker 설치
# docker ps -a | grep jenkins
# docker exec -it 1a13a76c2c69 /bin/bash
# curl -fsSLO http://download.docker.com/linux/static/edge/x86_64/docker-17.04.0-ce.tgz
# tar xzvf docker-17.04.0-ce.tgz
# rm -r docker docker-17.04.0-ce.tgz
# docker login
# cd /home
# git clone https://github.com/changwskr/roian
# exit
#
#
# jenkins rebuild call
# http://localhost:8080/job/sp_commo.make/build?token=sp_commo_build






