[ansible-server]
    - exe
        ansible-playbook -i ./playbook/hosts-docker ./playbook/dockerserver/create-cicd-project-image-playbook.yml
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