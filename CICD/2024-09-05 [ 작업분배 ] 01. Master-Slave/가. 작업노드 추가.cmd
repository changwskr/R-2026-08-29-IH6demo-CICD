1) 노드 추가
   기본노드 정보 git java 설치
    docker run --privileged ^
            --name jenkins-node1 ^
            -itd ^
            -p 30022:22 ^
            -e container=docker ^
            -v /sys/fs/cgroup:/sys/fs/cgroup ^
            --cgroupns=host ^
            edowon0623/docker:latest /usr/sbin/init

2) Jenkins 서버에 JDK 설치
    yum install -y ncurses git
    yum list java*jdk-devel
    yum install -y java-11-openjdk-devel.aarch64