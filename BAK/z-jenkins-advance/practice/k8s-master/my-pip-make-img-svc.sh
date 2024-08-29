echo "rmi"
docker rmi changwskr/my-pip-f07-tomcat
echo $?

echo "build"
docker build -t changwskr/my-pip-f07-tomcat .
echo $?

echo "push"
docker push changwskr/my-pip-f07-tomcat
echo $?

echo "deploy-apply"
kubectl apply -f  my-pip-f07-deployment.yml
echo $?

echo "svc-apply"
kubectl apply -f  my-pip-f07-service.yml
echo $?