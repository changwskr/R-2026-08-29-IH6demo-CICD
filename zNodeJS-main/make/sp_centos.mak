#------------------------------------------------------------------
# docker image name : myroiandev
#-------------------------------------------------------------------
# port 정보
# CentOS
# Nginx : 80
# volta
# PM2 by volta
# Node, NPM (express) : 7101
# python3, pip  (flask)  : 7201
# MySQL 8
# rsync, rcp setting: 22
# 공유볼륨 : home/roian/workspace/sfd -> /home/workspace
# -----------------------------------------------------------------
docker container run -it --name "myroiandev" --hostname myroiandev -v /home/roian/workspace/sfd:/home/workspace -p 80:80 -p 7101:7101 -p 7201:7201 centos /bin/bash
#  $myroiandev> yum install epel-release -y
#  $myroiandev> yum install which -y
#  $myroiandev> yum install telnet -y
#  $myroiandev> yum install rsync -y
#  $myroiandev> yum install openssh-clients -y
# -----------------------------------------------------------------
#  Install NginX
# -----------------------------------------------------------------
# vi /etc/yum.repos.d/nginx.repo
# [nginx]
# name=nginx repo
# baseurl=http://nginx.org/packages/centos/7/$basearch/
# gpgcheck=0
# enabled=1
# wq!
#
# $myroiandev> yum install nginx -y
# $myroiandev> nginx
# $myroiandev> nginx -s stop
#
# -----------------------------------------------------------------
#  Install Volta
# -----------------------------------------------------------------
# $myroiandev> curl https://get.volta.sh | bash
# (exit)
# (docker ps -a)
# (docker stop cid)
# (docker start cid)
# (docker attach cid)
# $myroiandev> volta install node@14   
# $myroiandev> volta install pm2
# $myroiandev> yum install python3 -y
#
# -----------------------------------------------------------------
#  nginx 환경
# -----------------------------------------------------------------
#  cd /etc/nginx
# vi nginx.conf
# root         /usr/share/nginx/html; -> root         /home/workspace/www/myroian; 변경
# (wq)
# 외부[roian@docker-centos www]$ curl http://localhost:80
#
# cd /etc/nginx/conf.d/
# vi local.conf
# server {
#         listen 80;
#         server_name local.myroian.com;
#
#         location / {
#                 root   /home/workspace/www/myroian;
#                 index  index.html;
#                 try_files $uri /index.html;
#         }
# }
#
# -----------------------------------------------------------------
#  local.myroian.com 등록(docker 와 본머신에서 같이 셋팅)
# -----------------------------------------------------------------
#  vi etc/hosts
#  127.0.0.1 local.myroian.com
#
#  nginx -s reload
#
# -----------------------------------------------------------------
# docker time 
# -----------------------------------------------------------------
# ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime
#
# -----------------------------------------------------------------
# ssh key gen
# -----------------------------------------------------------------
# ssh-keygen -t rsa
# ls -l .ssh
# [root@myroiandev ~]# ls -l .ssh
# total 8
# -rw-------. 1 root root 2602 Jul  3 17:39 id_rsa
# -rw-r--r--. 1 root root  569 Jul  3 17:39 id_rsa.pub
#
# ssh-copy-id -i .ssh/id_rsa.pub roian@10.100.0.108 -p portno
#
# rsync 설치
# rsync -avz 10.100.0.108:/root/check.txt . -e 'ssh -p 3000'
#
# -----------------------------------------------------------------
#  docker image commit
# -----------------------------------------------------------------
#  docker commit myroiandev myroiandevimg
#
#
