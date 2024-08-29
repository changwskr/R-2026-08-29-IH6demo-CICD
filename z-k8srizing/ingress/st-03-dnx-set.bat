
echo "Ingress 리소스가 제대로 설정되었다면, Ingress Controller의 IP 주소를 사용하여 도메인 네임을 설정해야 합니다. Ingress Controller의 IP 주소를 확인합니다."

kubectl get services -o wide -w -n ingress-nginx
