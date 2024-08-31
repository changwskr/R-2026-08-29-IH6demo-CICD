1. 컨테이너 운영 중지
    docker stop [컨테이너 이름]
    예시) docker stop abcd
    ■■■  docker stop my-tomcat

2. 기존 컨테이너를 이미지 저장
    docker commit [컨테이너 이름] [저장할 이미지명]
    예시) docker commit abcd acbd_240229
    ■■■ docker commit my-tomcat my-tomcat-new

3. 기존 컨테이너의 삭제
    docker rm [컨테이너 이름]
    예시) docker rm abcd
    ■■■ docker rm  my-tomcat

4. docker run 으로 재기동
    예시) docker run -d -e TZ=Asia/Seoul --restart unless-stopped --name abcd -p8080:8080 -p5000:5000 abcd_240229:latest
    설명) -p 가 포트 정보 이며, 기존 8080 외에 5000번을 추가함
    ■■■ docker run -d -p 9090:8080 --name my-tomcat-new my-tomcat-new
