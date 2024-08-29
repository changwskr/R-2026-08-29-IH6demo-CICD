

rem   https://docs.ansible.com/ansible/2.9/modules/list_of_all_modules.html
rem
rem   패키지 설치 여부 확인 (컨테이너에서 실행)
rem         yum list installed | grep httpd
rem   패키지 설치
rem         ansible devops -m yum -a "name=httpd state=present"

ssh root@localhost -p 20022
ansible all -m ping
    m은 모듈을 의미한다.
    ping은 3번 4번서버로 정상 동작하는지 체킹한다는 의미이다.

[root@c7d8ab75a377 ~]# cat /etc/ansible/hosts
[devops]
172.17.0.3
172.17.0.4
[root@c7d8ab75a377 ~]# ansible all -m ping
172.17.0.3 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
172.17.0.4 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}

[root@c7d8ab75a377 ~]# ansible devops -m ping

172.17.0.3 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
172.17.0.4 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}


#   --------------------------------
  시나리오
  dokcer-server를 중단하고 ansible all -m ping 하면 어떻게 될까

  docker stop docker-serever로 컨테이너를 중단한다.
  docker start docker-server로 컨테이너를 기동한다.
#   ---------------------------------
