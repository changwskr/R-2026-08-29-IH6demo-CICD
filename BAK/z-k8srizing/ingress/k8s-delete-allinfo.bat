kubectl delete service/app1 service/app2
kubectl delete ingress example-ingress
kubectl delete deployment app1 app2

kubectl delete pod app1~~~
kubectl delete pod app2~~~
kubectl delete pod/app1~~ pod/app2~~

kubectl get pod,service,deployment
kubectl delete service/nginx-test \
               service/nginx-test-loadbalancer \
               service/tomcat-service  \
               deployment.apps/tomcat-deployment

kubectl delete pod nginx-test

