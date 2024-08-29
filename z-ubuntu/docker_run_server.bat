
docker run --privileged --name docker-server -itd -p 10022:22 -p 8082:8080 -e container=docker -v /sys/fs/cgroup:/sys/fs/cgroup edowon0623/docker:latest /usr/sbin/init
echo "root/P@ssw0rd"

# docker-server로 로그인하고 docker 상태를 확인해보자
sh-4.4# systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
     Docs: https://docs.docker.com
sh-4.4# systemctl start docker

