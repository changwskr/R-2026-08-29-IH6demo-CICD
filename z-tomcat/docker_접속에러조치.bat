
# 접속장애 조치
container로 접속해서
    mv webapp webapp.tmp
    cp -r webapp.dist webapp

# vi 설치 스크립터
apt-get update
apt-get install vim


# tomcat-user.xml 사용자 정보 변경
 <role rolename="manager-gui"/>
   <role rolename="manager-script"/>
   <role rolename="manager-jmx"/>
   <role rolename="manager-status"/>

   <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
   <user username="deployer" password="deployer" roles="manager-script"/>
   <user username="tomcat" password="tomcat" roles="manager-gui"/>


# 접속장애 조치 (컨테이너로 기동시)
container로 접속해서
    mv webapp webapp.tmp
    cp -r webapp.dist webapp

# vi 설치 스크립터 (컨테이너 기동시)
apt-get update
apt-get install vim

# tomcat-user.xml 사용자 정보 변경
 <role rolename="manager-gui"/>
   <role rolename="manager-script"/>
   <role rolename="manager-jmx"/>
   <role rolename="manager-status"/>

   <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
   <user username="deployer" password="deployer" roles="manager-script"/>
   <user username="tomcat" password="tomcat" roles="manager-gui"/>
