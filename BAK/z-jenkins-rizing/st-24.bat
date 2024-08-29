
앤서벌서버에 cice-project-ansigle이미지를 dockerhub에 push한다. 도커허버계정은 changwskr이다.
이 작업을 ansigle-playbook으로 작업해 보자


[root@c7d8ab75a377 ~]# cat create-cicd-devops-container.yml
- hosts: all
# become : true
  tasks:
  - name: stop current running container
    command: docker stop my_cicd_project
    ignore_errors: yes

  - name: remove stopped container
    command: docker rm my_cicd_project
    ignore_errors: yes

  - name: remove current docker image
    command: docker rmi changwskr/cicd-project-ansible
    ignore_errors: yes

  - name: pull the newest docker image from changwskr docker hub
    command: docker pull changwskr/cicd-project-ansible

  - name: create a container using cicd-project-ansible image
    command: docker run -d --name my_cicd_project -p 8080:8080 changwskr/cicd-project-ansible

[root@c7d8ab75a377 st-23]# cat hosts
172.17.0.3

[root@c7d8ab75a377 st-23]# cat Dockerfile
FROM tomcat:9.0

LABEL org.opencontainers.image.authors="edowon0623@gmail.com"

COPY ./hello-world.war /usr/local/tomcat/webapps

[root@c7d8ab75a377 ~]# ls -l *.war
-rw-r--r-- 1 root root 8025931 Aug  8 07:43 hello-world.war
[root@c7d8ab75a377 ~]#

[root@c7d8ab75a377 ~]# ansible-playbook -i hosts create-cicd-devops-container.yml



[root@c7d8ab75a377 ~]# ansible-playbook -i hosts create-cicd-devops-container.yml --limit 172.17.0.3
PLAY [all] ****************************************************************************************************************************
TASK [Gathering Facts] ****************************************************************************************************************
ok: [172.17.0.3]
TASK [stop current running container] *************************************************************************************************
changed: [172.17.0.3]
TASK [remove stopped container] *******************************************************************************************************
changed: [172.17.0.3]
TASK [remove current docker image] ****************************************************************************************************
changed: [172.17.0.3]
TASK [pull the newest docker image from changwskr docker hub] *************************************************************************
changed: [172.17.0.3]
TASK [create a container using cicd-project-ansible image] ****************************************************************************
changed: [172.17.0.3]
PLAY RECAP ****************************************************************************************************************************
172.17.0.3                 : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
[root@c7d8ab75a377 ~]#


[root@c7d8ab75a377 ~]# ansible-playbook -i hosts create-cicd-devops-container.yml
PLAY [all] ****************************************************************************************************************************
TASK [Gathering Facts] ****************************************************************************************************************
ok: [172.17.0.3]
ok: [172.17.0.4]
TASK [stop current running container] *************************************************************************************************
changed: [172.17.0.4]
changed: [172.17.0.3]

ㅑ0





