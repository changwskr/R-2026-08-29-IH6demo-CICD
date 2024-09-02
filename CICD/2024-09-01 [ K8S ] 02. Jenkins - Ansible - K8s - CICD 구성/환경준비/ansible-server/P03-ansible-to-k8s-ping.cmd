ansible-server
    ansible -i ./k8s/hosts k8s -m ping

    [root@a83886fba2b5 ~]# ansible -i ./k8s/hosts k8s -m ping
    192.168.32.10 | SUCCESS => {
        "ansible_facts": {
            "discovered_interpreter_python": "/usr/bin/python3"
        },
        "changed": false,
        "ping": "pong"
    }