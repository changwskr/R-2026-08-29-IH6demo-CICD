echo "docker ansible server run"

rem 만약 완료가 되지 않으면 강제 종료이후 container도 재기동한다.
docker run --privileged --name ansible-server -p 20022:22 -p 8081:8080 -e container=docker -v /sys/fs/cgroup:/sys/fs/cgroup --cgroupns=host edowon0623/ansible:latest /usr/sbin/init

docker ps -a
