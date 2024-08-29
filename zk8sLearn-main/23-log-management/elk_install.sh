kubectl apply -f elasticsearch-master-configmap.yaml -f elasticsearch-master-service.yaml -f elasticsearch-master-deployment.yaml

kubectl apply -f pv.yaml

kubectl apply -f elasticsearch-data-configmap.yaml -f elasticsearch-data-service.yaml -f elasticsearch-data-statefulset.yaml

kubectl apply -f elasticsearch-client-configmap.yaml -f elasticsearch-client-service.yaml -f elasticsearch-client-deployment.yaml

kubectl exec -it $(kubectl get pods -n kube-logging | grep elasticsearch-client | sed -n 1p | awk '{print $1}') -n kube-logging -- bin/elasticsearch-setup-passwords auto -b

# https://waspro.tistory.com/762
