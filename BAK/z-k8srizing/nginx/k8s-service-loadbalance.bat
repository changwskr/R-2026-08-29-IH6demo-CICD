kubectl expose pod nginx-test --name nginx-test-loadbalancer --type=LoadBalancer --external-ip 192.168.0.29 --port 80
kubectl get service
echo "http://192.168.0.29