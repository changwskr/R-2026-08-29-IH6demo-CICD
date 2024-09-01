브라우저에서
http://roian.domain.com/app1과
http://roian.domain.com/app2에 접근하여 각 애플리케이션이 제대로 동작하는지 확인합니다.


요약
1.Ingress Controller 설치: Helm을 사용하여 Nginx Ingress Controller 설치.
2.애플리케이션 배포: 서비스와 함께 배포.
3.Ingress 리소스 정의: HTTP 경로를 서비스로 라우팅.
4.DNS 설정: 도메인 네임을 Ingress Controller의 IP 주소로 설정.
5.상태 확인 및 테스트: 브라우저에서 애플리케이션 접근 확인.


etc/hosts
127.0.0.1 roian.domain.com
등록