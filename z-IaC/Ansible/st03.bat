rem 도커 네트워크 상태를 확인한다.
docker network inspect bridge

rem "docker-server", "IPv4Address": "172.17.0.4/16", -- ansible의 클라이언트로 사용할 예정이다.
rem "ansible-server","IPv4Address": "172.17.0.3/16",
rem "jenkins-server", "IPv4Address": "172.17.0.2/16",


rem IntelliJ 에디터에서 세로줄 편집을 하는 방법을 설명하는 글입니다.
rem 단축키 : Alt + 마우스로 드래그 이후 편집

rem "ConfigOnly": false,
rem        "Containers": {
rem            "ba3d2db76bfb1e5615d2c8237d79be4565985bd3390d60423e05adbeee6c2717": {
rem                "Name": "docker-server",
rem                "EndpointID": "0441e6601b71f4007603eb9064f601f15248db6738bf63c3b71c3e8023ba0e4d",
rem                "MacAddress": "02:42:ac:11:00:04",
rem                "IPv4Address": "172.17.0.4/16",
rem                "IPv6Address": ""
rem            },
rem            "c7d8ab75a377fcc7cdd582a0190d0eeea40b62cec87457f69f287bc79492f1ef": {
rem                "Name": "ansible-server",
rem                "EndpointID": "7a6163c2de3052235bc80351a50a3a15fef4d8f356d43acf8f03edf33e202335",
rem                "MacAddress": "02:42:ac:11:00:03",
rem                "IPv4Address": "172.17.0.3/16",
rem                "IPv6Address": ""
rem            },
rem            "d3f4302cce754aca8af14c200ed75a250f985fc7d1dd9c3d7434bfcb3d04cbb2": {
rem                "Name": "jenkins-server",
rem                "EndpointID": "7dd2d89db2ca6f671f8b15044ac6c8b7d8730a1ceb237821e86e29d609c6c2b6",
rem                "MacAddress": "02:42:ac:11:00:02",
rem                "IPv4Address": "172.17.0.2/16",
rem                "IPv6Address": ""
rem            }
rem        },
