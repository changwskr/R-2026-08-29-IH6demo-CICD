하나의 리눅스 서버는 vagrant를 이용해서 사용하자

# 서버정보
    my-tomcat-app l(8081) - c(8080) c(8005)

# 192.168.0.4:10022
# 192.168.0.4:8082
    docker-server l(8082) - c(8080)
                  l(10022) - c(22) - 패스워드 : root/P@ssw0rd

# vagrant 서버를 이용할 수도 있다.
    192.168.32.11 - 22 - vagrant/vagrant root/!1974yoe01 dockeradmin/dockeradmin

# 아키텍처
    docker [jenkins    -8080,8005]
    pc     [192.168.0.4-8080,      10022]
    docker [docker-server-8082,    22]

# docker-server 로그인하여 docker 서비스 상태 확인
    systemctl status docker
    systemctl start docker
