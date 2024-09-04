
webapps/manager/META-INF/context.xml

$TOMCAT_HOM/webapps/manager/META-INF/context.xml 에서 valve 줄을 주석처리하면됩니다.

     <Context antiResourceLocking="false" privileged="true" >
       <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                        sameSiteCookies="strict" />
       <!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="192\.168\.0\.4|127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
       <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
     </Context>

     $TOMCAT_HOM/webapps/manager/META-INF/context.xml 에서 valve 줄에 192.168.0.4 ip 추가 해본다

     <Context antiResourceLocking="false" privileged="true" >
       <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                        sameSiteCookies="strict" />
        <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="192\.168\.0\.4|127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
       <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
     </Context>