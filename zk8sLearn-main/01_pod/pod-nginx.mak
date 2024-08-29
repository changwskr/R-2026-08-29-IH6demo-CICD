set -x
kubectl get nodes
sleep 3
kubectl run nginx-pod --image=nginx1.14 --port=80
sleep 3
kubectl delete pods nginx-pod
sleep 3
kubectl create -f pod-nginx.yaml
sleep 3
kubectl get pods
sleep 3
kubectl get pods -o wide | head -3
sleep 3
kubectl get pods -o yaml | head -3
sleep 3
kubectl get pods -o json | head -3 | echo ""
sleep 3
kubectl get pods nginx-pod -o json | grep -i podip
sleep 3
kubectl describe pod nginx-pod
sleep 3
kubectl exec nginx-pod -it -- /bin/bash
kubectl logs nginx-pod
sleep 3
kubectl delete pods nginx-pod
sleep 3
kubectl get pods
sleep 3
kubectl get namespace
sleep 3
kubectl delete namespace orange
