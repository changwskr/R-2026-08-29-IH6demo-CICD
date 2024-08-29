rem 메모리와 디스크 용량 확인

ssh root@localhost -p 20022

패키지가 설치되어 있는지 확인한다.
yum list installed | grep httpd

[root@c7d8ab75a377 ~]# ansible all -m shell -a "yum list installed | grep httpd"
172.17.0.3 | FAILED | rc=1 >>
non-zero return code
172.17.0.4 | FAILED | rc=1 >>
non-zero return code


# -----------------------------------------------------------------------------------
패키지를 설치한다.
ansible devops -m -a "name=httpd state=present"

[root@c7d8ab75a377 ~]# ansible devops -m yum -a "name=httpd state=present"
172.17.0.3 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "msg": "",
    "rc": 0,
    "results": [
        "Installed: apr-1.6.3-12.el8.x86_64",
        "Installed: httpd-filesystem-2.4.37-43.module_el8.5.0+1022+b541f3b1.noarch",
        "Installed: apr-util-1.6.1-6.el8.x86_64",
        "Installed: apr-util-bdb-1.6.1-6.el8.x86_64",
        "Installed: httpd-tools-2.4.37-43.module_el8.5.0+1022+b541f3b1.x86_64",
        "Installed: mod_http2-1.15.7-3.module_el8.4.0+778+c970deab.x86_64",
        "Installed: brotli-1.0.6-3.el8.x86_64",
        "Installed: apr-util-openssl-1.6.1-6.el8.x86_64",
        "Installed: mailcap-2.1.48-3.el8.noarch",
        "Installed: centos-logos-httpd-85.8-2.el8.noarch",
        "Installed: httpd-2.4.37-43.module_el8.5.0+1022+b541f3b1.x86_64"
    ]
}
172.17.0.4 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "msg": "",
    "rc": 0,
    "results": [
        "Installed: centos-logos-httpd-85.8-2.el8.noarch",
        "Installed: httpd-2.4.37-43.module_el8.5.0+1022+b541f3b1.x86_64",
        "Installed: apr-1.6.3-12.el8.x86_64",
        "Installed: httpd-filesystem-2.4.37-43.module_el8.5.0+1022+b541f3b1.noarch",
        "Installed: apr-util-1.6.1-6.el8.x86_64",
        "Installed: apr-util-bdb-1.6.1-6.el8.x86_64",
        "Installed: httpd-tools-2.4.37-43.module_el8.5.0+1022+b541f3b1.x86_64",
        "Installed: mod_http2-1.15.7-3.module_el8.4.0+778+c970deab.x86_64",
        "Installed: brotli-1.0.6-3.el8.x86_64",
        "Installed: apr-util-openssl-1.6.1-6.el8.x86_64",
        "Installed: mailcap-2.1.48-3.el8.noarch"
    ]
}
[root@c7d8ab75a377 ~]# ansible all -m shell -a "yum list installed | grep httpd"
172.17.0.3 | CHANGED | rc=0 >>
centos-logos-httpd.noarch           85.8-2.el8                              @baseos
httpd.x86_64                        2.4.37-43.module_el8.5.0+1022+b541f3b1  @appstream
httpd-filesystem.noarch             2.4.37-43.module_el8.5.0+1022+b541f3b1  @appstream
httpd-tools.x86_64                  2.4.37-43.module_el8.5.0+1022+b541f3b1  @appstream
172.17.0.4 | CHANGED | rc=0 >>
centos-logos-httpd.noarch           85.8-2.el8                              @baseos
httpd.x86_64                        2.4.37-43.module_el8.5.0+1022+b541f3b1  @appstream
httpd-filesystem.noarch             2.4.37-43.module_el8.5.0+1022+b541f3b1  @appstream
httpd-tools.x86_64                  2.4.37-43.module_el8.5.0+1022+b541f3b1  @appstream
[root@c7d8ab75a377 ~]#

#-----------------------------------------------------------
서비스 상태를 확인한다.
systemctl status httpd

[root@c7d8ab75a377 ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
     Docs: man:httpd.service(8)

