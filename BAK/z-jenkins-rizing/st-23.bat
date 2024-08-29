
앤서벌서버에 cice-project-ansigle이미지를 dockerhub에 push한다. 도커허버계정은 changwskr이다.
이 작업을 ansigle-playbook으로 작업해 보자


[root@c7d8ab75a377 st-23]# pwd
/root/st-23
[root@c7d8ab75a377 st-23]# cat create-cicd-devops-image.yml
- hosts: all
# become : true
  tasks:

  - name: create a docker image with deployed waf file
    command: docker build -t chagnwskr/cicd-project-ansible .
    args:
        chdir: /root/st-23

  - name: push the image on docker hub
    command: docker push changwskr/cicd-project-ansible
    ignore_errors: yes

  - name: remove the docker image from the ansible-server
    command: docker rmi changwskr/cice-project-ansible
    ignore_errors: yes

[root@c7d8ab75a377 st-23]# cat hosts
172.17.0.3

[root@c7d8ab75a377 st-23]# cat Dockerfile
FROM tomcat:9.0

LABEL org.opencontainers.image.authors="edowon0623@gmail.com"

COPY ./hello-world.war /usr/local/tomcat/webapps

