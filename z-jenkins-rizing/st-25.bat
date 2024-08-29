st-24번의 작업을 jenkins를 통해서 작업해 보자

Exec command

ansible-playbook -i hosts create-cicd-devops-images.yml --limit 172.17.0.3
ansible-playbook -i hosts create-cicd-devops-container.yml --limit 172.17.0.4