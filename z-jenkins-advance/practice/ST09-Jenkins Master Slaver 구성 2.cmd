https://u-it.tistory.com/366


(윈도)에서 노드를 하나만들고 java와 git을 설치한다.
#-----------------------------------------------------------------------------------------------------------------------
1. jenkins-node2 Docker 서버 실행
   docker run --privileged --name jenkins-node2 -itd -p 40022:22 -e container=docker -v /sys/fs/cgroup:/sys/fs/cgroup --cgroupns=host edowon0623/docker:latest /usr/sbin/init

    (jenkins-node2 로그인) 하여 jdk와 git을 설치한다.
        1.1 Docker 서버에 JDK 설치
            clear명령
            # yum install -y ncurses git

        1.2 설치 가능한 jdk 검색
        # yum list java*jdk-devel

        1.3 11버전 설치
        # yum install -y java-11-openjdk-devel.x86_64

        sh-4.4# git --version
        git version 2.27.0
        sh-4.4#



(jenkins-server로 로그인) jenkins-server에서 node2로 자유롭게 로그인 가능하도록 작업한다.
#-----------------------------------------------------------------------------------------------------------------------
docker exec -it jenkins-server bash (도커서버는 ssh 서버가 없어서 직접 터널링으로 들어간다)

2. 현재 가지고 있는 node1서버의 패스워드 key값 복사
    ※ SSH로 자유롭게 접속하기 위해서 KEY가 필요한데 이것은 대칭키 방식으로 만든다.

   2.1 jenkins-serever
        ssh-keygen

                    SSH(Secure Shell)는 비대칭키 방식과 대칭키 방식을 모두 사용하는 보안 프로토콜입니다.
                    1. 비대칭키 암호화 (Asymmetric Encryption)
                    초기 연결 및 인증 과정에서 SSH는 비대칭키 암호화를 사용합니다. 이때 클라이언트와 서버는 각각 자신의 공개키(public key)와 개인키(private key)를 사용하여 통신을 시작합니다.
                    예를 들어, 클라이언트는 서버의 공개키를 사용하여 세션 키를 암호화하고, 서버는 자신의 개인키를 사용하여 이 세션 키를 복호화합니다. 이 과정에서 인증과 초기 키 교환이 이루어집니다.
                    2. 대칭키 암호화 (Symmetric Encryption)
                    SSH는 초기 인증이 완료된 후, 데이터 전송 과정에서 대칭키 암호화를 사용합니다. 이때 사용되는 대칭키는 앞서 비대칭키 암호화 과정에서 생성된 세션 키입니다.
                    대칭키 암호화는 비대칭키 암호화에 비해 속도가 빠르기 때문에, 이후의 데이터 전송에서는 대칭키를 사용하여 효율적으로 통신을 보호합니다.
                    따라서, SSH는 비대칭키 암호화를 사용하여 초기 연결을 설정하고, 이후에는 대칭키 암호화를 사용하여 데이터 전송을 보호하는 방식입니다. 이 혼합적인 접근 방식은 보안성과 성능을 모두 고려한 것입니다.

    2.2 ssh-copy-id root@172.17.0.7
        (윈도우) docker network inspect bridge
        "Containers": {
                "2440ca83c27ce3e839a819d1aeaba3a0dad88a3b8554c5fa54fe2317d38ed692": {
                    "Name": "jenkins-node1",
                    "EndpointID": "635ec732c13149fe5ad84415ee7a755bc502b6446559c49aecf95dc8491058e0",
                    "MacAddress": "02:42:ac:11:00:07",
                    "IPv4Address": "172.17.0.7/16",
                    "IPv6Address": ""
                },

        (jenkins-server 로그인)
        $ ssh-keygen
        Generating public/private rsa key pair.
        Enter file in which to save the key (/var/jenkins_home/.ssh/id_rsa):
        /var/jenkins_home/.ssh/id_rsa already exists.
        Overwrite (y/n)? y
        Enter passphrase (empty for no passphrase):
        Enter same passphrase again:
        Your identification has been saved in /var/jenkins_home/.ssh/id_rsa
        Your public key has been saved in /var/jenkins_home/.ssh/id_rsa.pub
        The key fingerprint is:
        SHA256:wfeBYciJq8fAmBPOT/4cZsEHt7Z1Q2SSaGfv1e7ED6o jenkins@d3f4302cce75
        The key's randomart image is:
        +---[RSA 3072]----+
        |       o ++oo    |
        |  .   o.B.+=.    |
        | o = . =o+oo.  . |
        |  * + + +o..+.. .|
        |   = + +So o.o o |
        |    + * .   . . +|
        |     * .     . +.|
        |      o     .   o|
        |          E.     |
        +----[SHA256]-----+
        $
        $ ssh-copy-id root@172.17.0.7
        /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/jenkins_home/.ssh/id_rsa.pub"
        /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
        /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
        root@172.17.0.7's password:

        Number of key(s) added: 1

        Now try logging into the machine, with:   "ssh 'root@172.17.0.7'"
        and check to make sure that only the key(s) you wanted were added.

        $
        $ ssh root@172.17.0.7

        jenkins@d3f4302cce75:/$ hostname -i
        172.17.0.2
        jenkins@d3f4302cce75:/$ ssh-copy-id root@172.17.0.7
        /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/jenkins_home/.ssh/id_rsa.pub"
        /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed

        /usr/bin/ssh-copy-id: WARNING: All keys were skipped because they already exist on the remote system.
                        (if you think this is a mistake, you may want to use -f option)

        jenkins@d3f4302cce75:/$ ssh-copy-id root@172.17.0.8
        /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/jenkins_home/.ssh/id_rsa.pub"
        /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed

        /usr/bin/ssh-copy-id: WARNING: All keys were skipped because they already exist on the remote system.
                        (if you think this is a mistake, you may want to use -f option)

Jenkins에서 node2를 등록한다.
#-----------------------------------------------------------------------------------------------------------------------
3. Jenkins에서 Node 등록
   1. node관리 이동
Dashboard
    Jenkins 관리
        Nodes


jenkins-slave에서 디렉토리를 생성한다.
#-----------------------------------------------------------------------------------------------------------------------

    sh-4.4# mkdir slave2
    sh-4.4# ls
    Dockerfile  anaconda-ks.cfg  anaconda-post.log  original-ks.cfg  slave2
    sh-4.4# cd slave2
    sh-4.4# pwd
    /root/slave2
    sh-4.4#


아이템을 등록한다.  My-Advanced_F05
#-----------------------------------------------------------------------------------------------------------------------
Dashboard
    My-Advanced_F05
        Configuration

            (체크) Restrict where this project can be run
                Label Expression
                ?
                    slave2

jenkins-slave1 서버에 가서 workspace가 있는지 확인한다.
#-----------------------------------------------------------------------------------------------------------------------

sh-4.4# pwd
/root/slave2/workspace
sh-4.4# ls
My-Advanced_F05
sh-4.4#