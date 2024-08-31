#-----------------------------------------------------------------------------------------------------------------------
[ 접속장애 조치 ]
    container로 접속해서
    cd /usr/local/tomcat
    cp -R ./webapps.dist/* ./webapps/

#-----------------------------------------------------------------------------------------------------------------------
[ vi 설치 스크립터 ]
    apt-get update
    apt-get install vim
#-----------------------------------------------------------------------------------------------------------------------
[ tomcat-user.xml 사용자 정보 변경 ]
    root@93237b60a700:/usr/local/tomcat/conf# ls -l *user*
    -rw-r--r-- 1 root root 2756 Aug  2 15:14 tomcat-users.xml

    vi tomcat-users.xml
    -------------------------------------------------------------------------------------------------------------------
     <role rolename="manager-gui"/>
       <role rolename="manager-script"/>
       <role rolename="manager-jmx"/>
       <role rolename="manager-status"/>
       <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
       <user username="deployer" password="deployer" roles="manager-script"/>
       <user username="tomcat" password="tomcat" roles="manager-gui"/>
       -------------------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------------
[ 접속장애 조치 (컨테이너로 기동시) ]
    container로 접속해서
        mv webapp webapp.tmp
        cp -r webapp.dist webapp

    # vi 설치 스크립터 (컨테이너 기동시)
        apt-get update
        apt-get install vim

    # tomcat-user.xml 사용자 정보 변경
        cd /usr/local/tomcat/conf

        <role rolename="manager-gui"/>
        <role rolename="manager-script"/>
        <role rolename="manager-jmx"/>
        <role rolename="manager-status"/>

        <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
        <user username="deployer" password="deployer" roles="manager-script"/>
        <user username="tomcat" password="tomcat" roles="manager-gui"/>

#-----------------------------------------------------------------------------------------------------------------------
[ 2024-08-04-02 : tomcat 매니저 접근 ]
 $TOMCAT_HOM/webapps/manager/META-INF/context.xml

    cd/context.xml 에서 valve 줄을 주석처리하면됩니다.

    □ 한줄을 없애본다 (2024-08-31 버전에는 이것이 성공했다. 그런데 유저는 admin으로 해야 된다. deployer로 하면 권한이 없다.)
                    ▶▶▶▶▶▶▶▶
         <Context antiResourceLocking="false" privileged="true" >
           <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                            sameSiteCookies="strict" />
           <!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="192\.168\.0\.4|127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
           <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
         </Context>

    □ 다음내용을 추가해 본다 (이것으로 하면 에러)
         $TOMCAT_HOM/webapps/manager/META-INF/context.xml 에서 valve 줄에 192.168.0.4 ip 추가 해본다

         <Context antiResourceLocking="false" privileged="true" >
           <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                            sameSiteCookies="strict" />
            <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="192\.168\.0\.4|127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
           <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
         </Context>


2024-08-04-03 : 만약 톰캣서버가 도커 컨테이너내에 있더라도
   젠킨스에서 접근 url은
   HOST PC IP로 한다.
   http://192.168.0.4:8081/
   그리고 container tomcat port는 8081을 오픈한다.
