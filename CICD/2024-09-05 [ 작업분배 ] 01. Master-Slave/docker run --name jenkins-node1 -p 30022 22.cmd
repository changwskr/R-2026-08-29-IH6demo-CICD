    docker run --privileged ^
            --name jenkins-node1 ^
            -itd ^
            -p 30022:22 ^
            -e container=docker ^
            -v /sys/fs/cgroup:/sys/fs/cgroup ^
            --cgroupns=host ^
            edowon0623/docker:latest /usr/sbin/init