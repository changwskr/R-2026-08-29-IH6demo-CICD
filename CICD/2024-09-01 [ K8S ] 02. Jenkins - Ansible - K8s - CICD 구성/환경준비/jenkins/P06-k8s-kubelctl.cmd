
root@k8s-master:~# kubectl get all
NAME                                   READY   STATUS    RESTARTS      AGE
pod/cicd-deployment-75bdc45fd9-cjrrv   1/1     Running   1 (59m ago)   33h
pod/cicd-deployment-75bdc45fd9-qz7q2   1/1     Running   1 (60m ago)   33h

NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/cicd-service   NodePort    10.103.186.193   <none>        8080:32000/TCP   33h
service/kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP          355d

NAME                              READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/cicd-deployment   2/2     2            2           33h

NAME                                         DESIRED   CURRENT   READY   AGE
replicaset.apps/cicd-deployment-75bdc45fd9   2         2         2       33h


-------------------------------------------------
만약 node에서 다음과 같은 에러가 발생시
couldn't get current server API group list: Get "http://localhost:8080/api?timeout=32s": dial tcp [::1]:8080: connect: connection refused
couldn't get current server API group list: Get "http://localhost:8080/api?timeout=32s": dial tcp [::1]:8080: connect: connection refused
couldn't get current server API group list: Get "http://localhost:8080/api?timeout=32s": dial tcp [::1]:8080: connect: connection refused

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/kubelet.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

