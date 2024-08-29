rem ansible 서버에 로그인하여
rem ssh-keyjen을 이용하여 키를 생성하고 이것을 두개의 서버에 ssh-copy를 이용해 복사한다.

rem ansible-server에 로그인한다.
ssh root@localhost -p 20022

#-----------------------------rsa 를이용해거 pub key와 pri key 생성
[root@c7d8ab75a377 ~]# ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa):
Created directory '/root/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:lLhxJ8bTpSiUewIGrndeJPMtjuZBxkE+V/Mytuf2IC8 root@c7d8ab75a377
The key's randomart image is:
+---[RSA 3072]----+
|  ... ..o   .    |
| . oo..+ * o     |
|  ..*.*.& =      |
| . . OoX.B       |
|. . = =oS .      |
| . = + . o       |
|    = . . +      |
|   o .  E+ o     |
|    .    .. .    |
+----[SHA256]-----+

[root@c7d8ab75a377 ~]# cd .ssh
[root@c7d8ab75a377 .ssh]# pwd
/root/.ssh

[root@c7d8ab75a377 .ssh]# ls
id_rsa  id_rsa.pub
[root@c7d8ab75a377 .ssh]# cat id_rsa
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn
NhAAAAAwEAAQAAAYEAsee7gC8QDAQHW5MSBf7ktrHp2Uipny7IvX2AR3KxQ/BD26MDVFfr
neTXQBBKzLXgYHUDs7AnhQQo550lB56qA604YyuowWnAWVxq2lqqef4oFmNzc7f18isOg1
Qn9zoChiXTspdknsn5jd1wsEP+IPkIUC7JFqWbv8M3OsiNwdU1N+k+lxHFzChw1mUJYbw7
......
9rkydM+gArXnw9LSLyD0SjRWMYtml6rDu7YkCwrSuBvxIVZoSELWPWZKj/wGpe5msyUqhK
IYU7ihFuX39iHAo1oNEMb1AUe36MZYmUbSV8jKUp3IwgfJHJEF5irGR9PX0pwRdAPAUBog
TgCAchoP5a+ow98ojj/Z4xE91yDkGBs1YOQ0+vSSp6znKQHr1a9UO5DmxViGirvaKBIh5K
qvS1br+2AygsEAAAARcm9vdEBjN2Q4YWI3NWEzNzcBAg==
-----END OPENSSH PRIVATE KEY-----
[root@c7d8ab75a377 .ssh]# ls
id_rsa  id_rsa.pub
[root@c7d8ab75a377 .ssh]# cat id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCx57uALxAMBAdbkxIF/uS2senZSKmfLsi9fYBHcrFD8EPbowNUV+ud5NdAEErMteBgdQOzsCeFBCjnnSUHnqoDrThjK6jBacBZXGraWqp5/igWY3Nzt/XyKw6DVCf3OgKGJdOyl2SeyfmN3XCwQ/4g+QhQLskWpZu/wzc6yI3B1TU36T6XEcXMKHDWZQlhvDtYLgrh2rgNceDqfYm9+eRb1WrM8Sw3ZUYWXGDMlKu7KHElIgs6w0mswFfOum5/GpvxD9hTFbdVielUWoeJ64Uj77061t0HD4MFMLGZH5cVSznXnOmcvWU4dji8KMkFmy/EpfrzpOPOz4O82NbYGr5NcPNJzXu1w1bUc9nCWa7qWaIJRK7MF8tCiNza2jQzR5VUbYU4elU3jeyaQVyK/ZTdeg4gpCqIif+YAqCkBXgiHRtQQQJR+9myjxG4PE5hCUVNQdWA/XgZK9OQN7WXGnKCRzLyruO+dv0lO05RoXb3nk+otKr3SJH8ARbFWvjZ8AE= root@c7d8ab75a377
[root@c7d8ab75a377 .ssh]#

#------------------------------ docker server login
[root@c7d8ab75a377 .ssh]# echo "docker-server login try"
docker-server login try
[root@c7d8ab75a377 .ssh]# ssh root@172.17.0.4
The authenticity of host '172.17.0.4 (172.17.0.4)' can't be established.
ECDSA key fingerprint is SHA256:VCKdt7lv58mHtFbQ/y6bpbAYiLxEBJ3IlyDjHmdGDZc.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
root@172.17.0.4's password:
Last failed login: Mon Aug  5 13:54:45 UTC 2024 from 172.17.0.3 on ssh:notty
There was 1 failed login attempt since the last successful login.
Last login: Sun Aug  4 11:21:26 2024 from 172.17.0.1
[root@ba3d2db76bfb ~]#

# ---------------------------- 공개키를 각서버에 복사
[root@c7d8ab75a377 ~]# ssh-copy-id root@172.17.0.4
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@172.17.0.4's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'root@172.17.0.4'"
and check to make sure that only the key(s) you wanted were added.

# ---------- 이제부턴 패스워드 없이 각 서버로 접근가능해진다.
[root@c7d8ab75a377 ~]# ssh root@172.17.0.4
Last login: Mon Aug  5 13:55:16 2024 from 172.17.0.3
[root@ba3d2db76bfb ~]#


# -----------ansible server에서 같이 복사해 준다
[root@c7d8ab75a377 ~]# ssh-copy-id root@172.17.0.3
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@172.17.0.3's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'root@172.17.0.3'"
and check to make sure that only the key(s) you wanted were added.

[root@c7d8ab75a377 ~]# ssh root@172.17.0.3
Last login: Mon Aug  5 14:02:13 2024 from 172.17.0.3
[root@c7d8ab75a377 ~]#