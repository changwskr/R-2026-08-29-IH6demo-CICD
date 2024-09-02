ansible-server
    ansible-playbook -i ./k8s/hosts ./k8s/k8s-cicd-deployment-playbook.yml
    ansible-playbook -i ./k8s/hosts ./k8s/k8s-cicd-service-playbook.yml
