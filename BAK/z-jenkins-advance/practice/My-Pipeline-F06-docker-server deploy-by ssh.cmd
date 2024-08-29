# 1. 먼저 docker-server에 docker가 기동중인지 확인한다
------------------------------------------------------------------------------------------------------------------------
docker ps -a | grep docker-server
docker ps -a | findstr docker-server
            ba3d2db76bfb   edowon0623/docker:latest    "/sbin/init systemct??   6 days ago     Up 27 hours    0.0.0.0:10022->22/tcp, 0.0.0.0:8082->8080/tcp      docker-server

docker network inspect bridge
            "ba3d2db76bfb1e5615d2c8237d79be4565985bd3390d60423e05adbeee6c2717": {
                "Name": "docker-server",
                "EndpointID": "afe77be6c206b844d12ab5c1c0384cd015764653729528cdd7233426eddb9d8e",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            },
# 2. jenkins 서버와 docker-server ssh 접속을 위한 ssh-keyjen 작업을 완료되어야 된다
------------------------------------------------------------------------------------------------------------------------
docker ps -a | findstr docker-server
         0.0.0.0:10022->22/tcp, 0.0.0.0:8082->8080/tcp      docker-server
         로컬에서 10022로해서 docker-container로 접근한다.

docker ps -a | findstr jenkins
        0.0.0.0:8080->8080/tcp, 0.0.0.0:50000->50000/tcp   jenkins-server
        아쉽게도 jenkins 서버에는 22번 포터로 접근하는 ssh는 없다.

(host) ssh root@localhost -p 10022
    C:\Programming(23-08-15)\vagrant-work>ssh root@localhost -p 10022
    root@localhost's password:
    Last login: Sat Aug 10 05:46:23 2024 from 172.17.0.1
    [root@ba3d2db76bfb ~]#

(jenkins-server)
    먼저 docker-server로 접근하고
    docker-server에서 jenkins 서버로 접근하고
    jenkin-server에서 docker-server로 접근한다.

# 3. docker-server에서 확인해야 되는 파일목록
------------------------------------------------------------------------------------------------------------------------
[root@ba3d2db76bfb ~]# ls -l
    total 7872
    -rw-r--r-- 1 root root     129 Sep 20  2022 Dockerfile
    -rw-r--r-- 1 root root 8025932 Aug  4 13:24 hello-world.war

    Hello-world.war 파일은 jenkins 파이프라인을 통해 배포받는다.

    root@k8s-node01:~# cat Dockerfile
        FROM tomcat:9.0
        COPY ./hello-world.war /usr/local/tomcat/webapps


    docker build --tag chagnwskr/hello -f Dockerfile . ( 이 명령어가 실행되는지 확인해 본다 )


# 4. 이제 jenkins 서버에서 conf에 docker-server와 ssh 연동하기 위한 정보 추가
------------------------------------------------------------------------------------------------------------------------
Dashboard
    Jenkins 관리
        System

            SSH Server
            Name
            ?
                docker-server
            Hostname
            ?
                172.17.0.4
            Username
            ?
                root
            Remote Directory
            ?
                .

# 4. jenkins에서 스크립터 수정한다.
------------------------------------------------------------------------------------------------------------------------
Dashboard
    My-Pipeline-F06-docker-server deploy-by
        Configuration

            pipeline {
                agent any
                tools {
                    maven 'Maven3.8.5'
                }
                stages {
                    stage('github clone'){
                        steps {
                            git branch: 'main', url: 'https://github.com/joneconsulting/cicd-web-project.git'
                        }

                    }
                    stage('build'){
                        steps {
                            sh '''
                                echo build start
                                mvn clean compile package -DskipTest=true
                            '''
                        }
                    }
                    stage('deploy'){
                        steps {
                            deploy adapters: [tomcat9(credentialsId: 'admin_user', path: '', url: 'http://192.168.0.8:8088')], contextPath: null, war: '**/*.war'            }
                    }
                    stage('ssh publisher'){
                        steps {
                            sshPublisher(publishers: [sshPublisherDesc(configName: 'docker-server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker build --tag chagnwskr/hello -f Dockerfile .', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: 'target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
                        }
                    }
                }
            }