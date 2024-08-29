
앤서벌서버에 cice-project-ansigle이미지를 dockerhub에 push한다. 도커허버계정은 changwskr이다.
ansible-server
    docker tag cicd-project-ansible edowon0623/cice-project-ansible

    [root@c7d8ab75a377 ~]# docker login  (changwskr/!1974yoe0)
    Authenticating with existing credentials...
    WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
    Configure a credential helper to remove this warning. See
    https://docs.docker.com/engine/reference/commandline/login/#credentials-store

    Login Succeeded
    [root@c7d8ab75a377 ~]# docker images
    REPOSITORY                        TAG       IMAGE ID       CREATED        SIZE
    cicd-project-ansible              latest    e258aad359c4   18 hours ago   479MB
    <none>                            <none>    d998ab1884ac   18 hours ago   479MB
    <none>                            <none>    6ef788e6051d   18 hours ago   479MB
    <none>                            <none>    a64406441ffc   18 hours ago   479MB
    <none>                            <none>    04f92964ae8e   19 hours ago   479MB
    tomcat                            9.0       f23130139036   47 hours ago   471MB
    [root@c7d8ab75a377 ~]# docker tag cicd-project-ansible changwskr/cice-project-ansible
    [root@c7d8ab75a377 ~]# docker images
    REPOSITORY                        TAG       IMAGE ID       CREATED        SIZE
    changwskr/cice-project-ansible    latest    e258aad359c4   18 hours ago   479MB
    [root@c7d8ab75a377 ~]#
    [root@c7d8ab75a377 ~]# docker push changwskr/cice-project-ansible
    Using default tag: latest
    The push refers to repository [docker.io/changwskr/cice-project-ansible]
    fcde091394d9: Pushed
    5f70bf18a086: Mounted from library/tomcat
    92be6d7d176d: Mounted from library/tomcat
    d6906dc30bee: Mounted from library/tomcat
    8c898876677c: Mounted from library/tomcat
    d6843b9cd847: Mounted from library/tomcat
    c72ec1f3fa99: Mounted from library/tomcat
    25224a50eec4: Mounted from library/tomcat
    a30a5965a4f7: Mounted from library/tomcat
    latest: digest: sha256:52dca247d0ec9d7e93143970326c6765b83ae2704dc08826577fd36188c74fb3 size: 2412
    [root@c7d8ab75a377 ~]#



