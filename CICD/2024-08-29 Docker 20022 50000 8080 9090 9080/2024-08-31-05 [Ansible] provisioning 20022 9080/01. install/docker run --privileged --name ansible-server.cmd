docker run  --privileged ^
            --name ansible-server ^
            -p 20022:22 -p 8081:8080 ^
            -e container=docker -v /sys/fs/cgroup:/sys/fs/cgroup ^
            --cgroupns=host ^
            edowon0623/ansible:latest ^
            /usr/sbin/init
