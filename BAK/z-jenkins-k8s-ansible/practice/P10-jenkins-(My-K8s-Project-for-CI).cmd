이제부터 jenkins를 이용해서 cicd 환경을 구축하자

1. anisible-server에서 docker-server로 명령을 내릴 play-book을 만들자
   [ansible-server]
   - create-cicd-project-image-playbook.yml 파일 생성
        - hosts: all
        #   become: true

          tasks:
          - name: create a docker image with deployed waf file
            command: docker build -t changwskr/cicd-project-ansible .
            args:
                chdir: /root

          - name: push the image on Docker Hub
            command: docker push changwskr/cicd-project-ansible

          - name: remove the docker image from the ansible server
            command: docker rmi changwskr/cicd-project-ansible
            ignore_errors: yes

2. docker-serverdptj Dockerfile 생성해서 하나의 배포이미지를 만든다. 만들어질 이미지 이름음 changwskr/cicd-project-ansile 이다.
    [docker-serer]
    Dockerfile
        FROM tomcat:latest
        LABEL org.opencontainers.image.authors="changwskr@naver.com"
        COPY ./hello-world.war /usr/local/tomcat/webapps

3. 이 작업의 절차들은 jenkins에서 project를 통해서 실시한다.
   jenkins에서 하나의 project를 만든다. My-K8s-Project-for-CI
        빌드 후 조치
        Send build artifacts over SSH
        ?

        SSH Publishers
        SSH Server
        Name
        ?

        ansible-server
        고급
        Transfers
        Transfer Set
        Source files
        ?
        target/*.war
        Remove prefix
        ?
        target
        Remote directory
        ?
        .
        Exec command
        ?
        ansible-playbook -i ./k8s/hosts create-cicd-project-image.yml --limit localhost
        All of the transfer fields (except for Exec timeout) support substitution of Jenkins environmen


4. ansible-server 정보 확인
    [root@c7d8ab75a377 ~]# ls
    anaconda-ks.cfg    cicd-devops-deployment.yml        create-cicd-devops-image.yml     first-devops-playbook.yml  k8s                               k8s-cicd-service-playbook.yml  st-rsh    work
    anaconda-post.log  cicd-devops-service.yml           create-rsh-devops-image.yml.org  hello-world.war            k8s-cicd-deployment-playbook.yml  original-ks.cfg                test.bat
    ansible-k8s        create-cicd-devops-container.yml  Dockerfile                       hosts                      k8s-cicd-service-playbook.ym      st-23                          test.out

    [root@c7d8ab75a377 ~]#ansible-playbook -i ./k8s/hosts create-cicd-project-image.yml --limit localhost
    명령어가 실행되면 https://hub.docker.com/repository/docker/changwskr/cicd-project-ansible/general 서버에 도커이미지 push 된다.
    docker build -t changwskr/cicd-project-ansible .
    Dokerfile 이 현 디렉토리에 존재한다.


 =======================
| My-K8s-Project-for-CI
| =======================
| jenkins
|     ansible-playbook -i ./k8s/hosts create-cicd-project-image.yml --limit localhost
|         docker build -t changwskr/cicd-project-ansible .
|         docker push changwskr/cicd-project-ansible
|         docker rmi changwskr/cicd-project-ansible
|
|               =======================
|--------------> My-Ansible-K8s-Project
                =======================
                jenkins
                    ansible-playbook -i ./k8s/hosts k8s-cicd-deployment-playbook.yml;
                        kubectl delete deployment.apps/cicd-deployment
                        kubectl apply -f cicd-devops-deployment.yml
                    ansible-playbook -i ./k8s/hosts k8s-cicd-service-playbook.yml;
                        kubectl apply -f cicd-devops-service.yml




