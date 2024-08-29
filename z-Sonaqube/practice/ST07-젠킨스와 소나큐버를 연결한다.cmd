

1. 젠킨스에 플러그인 설치
    sonarqube scanner 를 설치한다.

2. credential 생성
    Dashboard
        Jenkins 관리
            Credentials
                System
                    Global credentials (unrestricted)
                        Add Credentials
                            Credentials that should be available irrespective of domain specification to requirements matching.
                                	sonarqube-token	sonarqube-token

3. 젠킨스에서 소나큐버 서버를 등록한다.

        docker network inspect bridge
        "8b68b91f82353d72aae7f96e4d6b3b6fd408cb2dd98a632de94f69afe3160ef6": {
                    "Name": "sonarqube",
                    "EndpointID": "2841cccfb52c5dc623169905923b40bc00021293b5a9e7ba06964da43feff9de",
                    "MacAddress": "02:42:ac:11:00:06",
                    "IPv4Address": "172.17.0.6/16",
                    "IPv6Address": ""
                },



    SonarQube servers
        If checked, job administrators will be able to inject a SonarQube server configuration as environment variables in the build.

        Environment variables
        SonarQube installations
        List of SonarQube installations
            Name
                SonarQube-server
            Server URL
                Default is http://localhost:9000
                http://172.17.0.6:9000
            Server authentication token
                sonarqube-token
