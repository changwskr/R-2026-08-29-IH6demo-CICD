
ansible-server [ pc - 9080  ansible-server       docker { 8080 - 8080(mytomcat) } ]
docker -server [ pc - 8081  docker-server  inner-docker { 8080 - 8080(mytomcat) } ]

http://localhost:9080/hello-world/