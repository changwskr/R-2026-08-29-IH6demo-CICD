



8. IH7cicd-web-project-main 프로젝트가 변경되어 git에 반영되면
   My-Seven-Pjt(Ansible)가 Git를 polling 하다 ansible에게 명령을 ssh를 통해서 전달한다.

    가. Poll SCM 을 체킹한다.
       스케쥴을 * * * * * 1분에 한번식 돌도록 저장


9. 그런데 먼저 만든 컨테이너와 이미지에 의해서 두번째 요청 실행은 실패할 것이다.
   그래서 이것을 방지하기 위해서
   ansible-server의 first-devops-ansible.yml 수정한다.

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
       command: docker rmi cicd-project-ansible
       ignore_errors: yes

     - name: build a docker image with deployed war file
       command: docker build -t cicd-project-ansible .
       args:
           chdir: /root

     - name: create a container using cicd-project-ansible image
       command: docker run -d --name my_cicd_project -p 8080:8080 cicd-project-ansible