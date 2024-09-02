만약 etc/sysconfig/docker 파일이 존재하지 않을 경우에는 다음의 절차는 필요없다.

$ vi /etc/sysconfig/docker
$ sed -i -e 's/overlay2/vfs/g' /etc/sysconfig/docker-storage
$ systemctl start docker
$ systemctl status docker