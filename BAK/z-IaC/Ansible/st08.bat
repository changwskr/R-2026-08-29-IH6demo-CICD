rem 파일 전송

ssh root@localhost -p 20022

[root@c7d8ab75a377 ~]# echo "Hi, there" >> test.txt
[root@c7d8ab75a377 ~]# cat test.txt
Hi, there
[root@c7d8ab75a377 ~]# hostname -i
172.17.0.3

# --------------------------------------------------------------
[root@c7d8ab75a377 ~]# ansible all -m copy -a "src=./test.txt dest=/tmp"
172.17.0.3 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "checksum": "5895edf4635b7166e8c0234ca1f4fbfdb5848c93",
    "dest": "/tmp/test.txt",
    "gid": 0,
    "group": "root",
    "md5sum": "c04382ba80c6913cdf7a0d34864ae325",
    "mode": "0644",
    "owner": "root",
    "size": 10,
    "src": "/root/.ansible/tmp/ansible-tmp-1722869125.863452-928-181169730639520/source",
    "state": "file",
    "uid": 0
}
172.17.0.4 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "checksum": "5895edf4635b7166e8c0234ca1f4fbfdb5848c93",
    "dest": "/tmp/test.txt",
    "gid": 0,
    "group": "root",
    "md5sum": "c04382ba80c6913cdf7a0d34864ae325",
    "mode": "0644",
    "owner": "root",
    "size": 10,
    "src": "/root/.ansible/tmp/ansible-tmp-1722869125.8713548-930-259829034582103/source",
    "state": "file",
    "uid": 0
}

# --------------------------------------------------------------
(윈도우) 에서 4번으로 로그인
PS C:\Users\chang> ssh root@localhost -p 10022
The authenticity of host '[localhost]:10022 ([::1]:10022)' can't be established.
ED25519 key fingerprint is SHA256:P8q7RKKK0u2Kt+rVi/M/thgw99R0Q/oDBhUJsZYvGqs.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[localhost]:10022' (ED25519) to the list of known hosts.
root@localhost's password:
Last login: Mon Aug  5 14:35:50 2024 from 172.17.0.3

[root@ba3d2db76bfb ~]#
[root@ba3d2db76bfb ~]# hostname -i
172.17.0.4

[root@ba3d2db76bfb ~]# ls /tmp/test.txt
/tmp/test.txt
