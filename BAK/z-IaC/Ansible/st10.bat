
미리 작업된 스크립터(플레이어북)을 실행하는 것
ssh root@localhost -p 20022


vi first-playbook.yml
---
- name: Ansible_vim
  hosts: localhost
  tasks:
    - name: Add ansible hosts
      blockinfile:
        path: /etc/ansible/hosts
        block:
          [mygroup]
          172.20.10.11

[root@c7d8ab75a377 work]# ansible-playbook first-playbook.yml
[root@c7d8ab75a377 work]#
[root@c7d8ab75a377 work]# cat /etc/ansible/hosts
[devops]
172.17.0.3
172.17.0.4
# BEGIN ANSIBLE MANAGED BLOCK
[mygroup]
172.20.10.11
# END ANSIBLE MANAGED BLOCK
[root@c7d8ab75a377 work]#


[root@c7d8ab75a377 work]# cat p*
---
- name: Ansible copy example local to remote
  hosts: devops
  tasks:
    - name: copying file with playbook
      copy:
        src: ~/work/sample.txt
        dest: /tmp
        owner: root
        mode: 0644
[root@c7d8ab75a377 work]#
[root@c7d8ab75a377 work]# ansible-playbook playbook-sample.yml

