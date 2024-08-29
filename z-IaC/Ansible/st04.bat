
rem "docker-server", "IPv4Address": "172.17.0.4/16", -- ansible의 클라이언트로 사용할 예정이다.
rem "ansible-server","IPv4Address": "172.17.0.3/16",
rem "jenkins-server", "IPv4Address": "172.17.0.2/16",
rem ssh ansible-server 접속을 해보자 P@ssw0rd

ssh root@localhost -p 20022

# 로그인이후 clear명령어가 먹이기 위해 다음의 명령어를 쳐준다
[root@c7d8ab75a377 ~]# yum install -y ncurses

# hostname 확인
[root@c7d8ab75a377 ~]# hostname -i

# ansible 확인
[root@c7d8ab75a377 ~]# ansible --version

# /etc/ansible/hosts 파일 생성
[root@c7d8ab75a377 ~]# ls -al /etc/ansible/hosts
   ls: cannot access '/etc/ansible/hosts': No such file or directory
[root@c7d8ab75a377 ~]# mkdir /etc/ansible
[root@c7d8ab75a377 ~]# vi /etc/ansible/hosts
참고로 ansible-server도 하나의 클라이언트로 관리한다.
[devops]
172.17.0.3
172.17.0.4

[db]
172.17.0.5

