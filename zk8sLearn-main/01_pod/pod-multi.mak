set -x
kubectl create -f pod-multi.yaml
sleep 3
kubectl get pods
sleep 3
kubectl get pods -o wide
sleep 3
kubectl exec multipod -it -c centos-container -- /bin/bash
sleep 3
kubectl logs multipod -c nginx-container
#curl http://localhost:80
#exit
sleep 3
kubectl delete pods multipod
