rem 메모리와 디스크 용량 확인

ssh root@localhost -p 20022

free -h

[root@c7d8ab75a377 ~]# free -h
              total        used        free      shared  buff/cache   available
Mem:          6.2Gi       2.6Gi       1.3Gi        16Mi       2.4Gi       3.3Gi
Swap:         2.0Gi       1.9Gi       147Mi

[root@c7d8ab75a377 ~]# ansible all -m shell -a "free -h"
172.17.0.3 | CHANGED | rc=0 >>
              total        used        free      shared  buff/cache   available
Mem:          6.2Gi       2.7Gi       1.2Gi        16Mi       2.4Gi       3.3Gi
Swap:         2.0Gi       1.9Gi       147Mi
172.17.0.4 | CHANGED | rc=0 >>
              total        used        free      shared  buff/cache   available
Mem:          6.2Gi       2.7Gi       1.2Gi        16Mi       2.4Gi       3.3Gi
Swap:         2.0Gi       1.9Gi       147Mi


[root@c7d8ab75a377 ~]# ansible all -m shell -a "ls /tmp/test.txt"
172.17.0.3 | CHANGED | rc=0 >>
/tmp/test.txt
172.17.0.4 | CHANGED | rc=0 >>
/tmp/test.txt

[root@c7d8ab75a377 ~]# ansible all -m shell -a "sh /tmp/test.sh | grep sshd"
172.17.0.3 | FAILED | rc=127 >>
sh: /tmp/test.sh: No such file or directorynon-zero return code
172.17.0.4 | CHANGED | rc=0 >>
3909 - exe
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 Aug04 ?        00:00:02 /sbin/init systemctl start sshd /usr/sbin/init
root          32       1  0 Aug04 ?        00:00:01 /usr/lib/systemd/systemd-journald
root          40       1  0 Aug04 ?        00:00:03 /usr/lib/systemd/systemd-udevd
dbus          56       1  0 Aug04 ?        00:00:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root          87       1  0 Aug04 ?        00:00:00 /usr/sbin/sshd -D -oCiphers=aes256-gcm@openssh.com,chacha20-poly1305@openssh.com,aes256-ctr,aes256-cbc,aes128-gcm@openssh.com,aes128-ctr,aes128-cbc -oMACs=hmac-sha2-256-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha2-256,hmac-sha1,umac-128@openssh.com,hmac-sha2-512 -oGSSAPIKexAlgorithms=gss-curve25519-sha256-,gss-nistp256-sha256-,gss-group14-sha256-,gss-group16-sha512-,gss-gex-sha1-,gss-group14-sha1- -oKexAlgorithms=curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1 -oHostKeyAlgorithms=ecdsa-sha2-nistp256,ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp521,ecdsa-sha2-nistp521-cert-v01@openssh.com,ssh-ed25519,ssh-ed25519-cert-v01@openssh.com,rsa-sha2-256,rsa-sha2-256-cert-v01@openssh.com,rsa-sha2-512,rsa-sha2-512-cert-v01@openssh.com,ssh-rsa,ssh-rsa-cert-v01@openssh.com -oPubkeyAcceptedKeyTypes=ecdsa-sha2-nistp256,ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp521,ecdsa-sha2-nistp521-cert-v01@openssh.com,ssh-ed25519,ssh-ed25519-cert-v01@openssh.com,rsa-sha2-256,rsa-sha2-256-cert-v01@openssh.com,rsa-sha2-512,rsa-sha2-512-cert-v01@openssh.com,ssh-rsa,ssh-rsa-cert-v01@openssh.com -oCASignatureAlgorithms=ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,ssh-ed25519,rsa-sha2-256,rsa-sha2-512,ssh-rsa
root         215       0  0 Aug04 pts/2    00:00:00 /bin/sh
root         313       1  0 Aug04 ?        00:02:16 /usr/bin/containerd
root         327       1  0 Aug04 ?        00:01:17 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
root        1980       1  0 Aug04 ?        00:00:05 fuse-overlayfs -o lowerdir=/var/lib/docker/fuse-overlayfs/l/S6W4YNBTCL36TOT5TQDM5XQ2LH:/var/lib/docker/fuse-overlayfs/l/VDWDV2MIICHZJROB7UKDWFVRJU:/var/lib/docker/fuse-overlayfs/l/CHGSI6NEANJFVL3YWBFAVOHKQW:/var/lib/docker/fuse-overlayfs/l/WFDUG5JCELZX63SLYECF2MU2WM:/var/lib/docker/fuse-overlayfs/l/G3KBTZKOIU4OW44JCFIKM5Q6XD:/var/lib/docker/fuse-overlayfs/l/YQUV26ENWBPSMHQMNU7SCZUFPF:/var/lib/docker/fuse-overlayfs/l/C3RA5PNHVPZQZQ7J3WM3INIAPB:/var/lib/docker/fuse-overlayfs/l/XLNCBPYNPSAQ4ZNZ7ZZD4RS4PI:/var/lib/docker/fuse-overlayfs/l/3WUUMF3ABPCKTUSY42LQHGU2CI:/var/lib/docker/fuse-overlayfs/l/ZLSGAPL3FQXNDFKFD6VHSJD5D5:/var/lib/docker/fuse-overlayfs/l/FBI3L66S5A3P3O26YRT4DFYGEJ,upperdir=/var/lib/docker/fuse-overlayfs/bead69a0b26c3f77506ed363f2566517415a6b65a90bfa04e692bcea5fc5c905/diff,workdir=/var/lib/docker/fuse-overlayfs/bead69a0b26c3f77506ed363f2566517415a6b65a90bfa04e692bcea5fc5c905/work /var/lib/docker/fuse-overlayfs/bead69a0b26c3f77506ed363f2566517415a6b65a90bfa04e692bcea5fc5c905/merged
root        2022     327  0 Aug04 ?        00:00:00 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8080 -container-ip 172.18.0.2 -container-port 8080
root        2029     327  0 Aug04 ?        00:00:00 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 8080 -container-ip 172.18.0.2 -container-port 8080
root        2044       1  0 Aug04 ?        00:00:03 /usr/bin/containerd-shim-runc-v2 -namespace moby -id eeae66efefc987316f68478231e8aaf0fea206f7ed67f58a15236ec506ac2012 -address /run/containerd/containerd.sock
root        2064    2044  0 Aug04 ?        00:02:05 /opt/java/openjdk/bin/java -Djava.util.logging.config.file=/usr/local/tomcat/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djdk.tls.ephemeralDHKeySize=2048 -Djava.protocol.handler.pkgs=org.apache.catalina.webresources -Dorg.apache.catalina.security.SecurityListener.UMASK=0027 -Dignore.endorsed.dirs= -classpath /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar -Dcatalina.base=/usr/local/tomcat -Dcatalina.home=/usr/local/tomcat -Djava.io.tmpdir=/usr/local/tomcat/temp org.apache.catalina.startup.Bootstrap start
root        3370      87  0 14:40 ?        00:00:00 sshd: root [priv]
root        3373    3370  0 14:40 ?        00:00:00 sshd: root@pts/1
root        3374    3373  0 14:40 pts/1    00:00:00 -bash
root        3818      87  1 14:49 ?        00:00:00 sshd: root [priv]
root        3820    3818  1 14:49 ?        00:00:00 sshd: root@pts/3
root        3897    3820  0 14:49 pts/3    00:00:00 /bin/sh -c /usr/libexec/platform-python /root/.ansible/tmp/ansible-tmp-1722869360.726578-1455-37036339651057/AnsiballZ_command.py && sleep 0
root        3908    3897 15 14:49 pts/3    00:00:00 /usr/libexec/platform-python /root/.ansible/tmp/ansible-tmp-1722869360.726578-1455-37036339651057/AnsiballZ_command.py
root        3909    3908  0 14:49 pts/3    00:00:00 sh /tmp/test.sh
root        3910    3909  0 14:49 pts/3    00:00:00 ps -edf