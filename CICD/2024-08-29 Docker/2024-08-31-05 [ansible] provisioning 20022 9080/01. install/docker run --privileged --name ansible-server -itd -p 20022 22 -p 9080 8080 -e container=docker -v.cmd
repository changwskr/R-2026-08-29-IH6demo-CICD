docker run  --privileged ^
            --name ansible-server ^
            -itd ^
            -p 20022:22 -p 9080:8080 ^
            -e container=docker ^
            -v /sys/fs/cgroup:/sys/fs/cgroup ^
            edowon0623/ansible:latest /usr/sbin/init

docker run -itd ^
            --name ansible-server ^
            -p 20022:22 ^
            -e container=docker^
            --tmpfs /run  ^
            --tmpfs /tmp  ^
            -v /sys/fs/cgroup:/sys/fs/cgroup:ro ^
            -v /var/run/docker.sock:/var/run/docker.sock ^
            edowon0623/ansible:latest /usr/sbin/init