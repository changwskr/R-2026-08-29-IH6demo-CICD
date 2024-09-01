
k8smaster 서버에서 확인

-rw-r--r-- 1 root root     410 Aug 10 13:10 cicd-devops-deployment.yml
-rw-r--r-- 1 root root     234 Aug 10 13:11 cicd-devops-service.yml
-rw-r--r-- 1 root root      66 Aug 10 13:03 Dockerfile
-rw-r--r-- 1 root root 8025933 Aug 10 13:01 hello-world.war

#--------------------make-shell---------------------
echo "rmi"
docker rmi changwskr/cicd-project-ansible
echo $?

echo "build"
docker build -t changwskr/cicd-project-ansible .
echo $?

echo "push"
docker push changwskr/cicd-project-ansible
echo $?

echo "deploy-apply"
kubectl apply -f  cicd-devops-deployment.yml
echo $?

echo "svc-apply"
kubectl apply -f  cicd-devops-service.yml
echo $?