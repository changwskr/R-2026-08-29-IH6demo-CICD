- hosts: all
  # become : true
  tasks:
  - name: build a docker image with deployed war file
    command: docker build -t cicd-project-ansible .
    args:
        chdir: /root


