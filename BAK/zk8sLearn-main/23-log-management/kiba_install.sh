kubectl apply -f kibana-configmap.yaml -f kibana-service.yaml -f kibana-deployment.yaml

kubectl get pods -n kube-logging

kubectl get service -n kube-logging

