echo "NodePort service의 port는 Nodeport-service-port를 나타내고, NodePort는 Host의 port를"
echo "그리고 target-port는 service 가 갈 pod의 port이다."
kubectl expose pod nginx-test --name nginx-test --type="NodePort" --port=80 --target-port=80 --protocol="TCP"
kubectl get services

echo "http://127.0.0.1:65532"