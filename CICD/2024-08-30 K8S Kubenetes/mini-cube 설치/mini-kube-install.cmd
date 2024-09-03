1. 사전준비
    ■ Root 계정 변경
        sudo su -
        passwd root
    ■ /etc/hosts
        192.168.32.10 k8s-master
        192.168.32.11 k8s-node01
        192.168.32.12 k8s-node02

    ■ docker user 생성
        useradd docker
        passwd docker
        cd /home
        mkdir docker
        chown -Rf docker:docker docker


1.docker 설치
    sudo apt-get update \
    && sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common -y \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add – \
    && sudo apt-key fingerprint 0EBFCD88 \
    && sudo add-apt-repository \
       “deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable” \
    && sudo apt-get update \
    && sudo apt-get install docker-ce docker-ce-cli containerd.io -y

#----------------------------------------------------------------------------------
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository “deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable”
sudo apt-get update \
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
#----------------------------------------------------------------------------------


1-1.계정 설정

    sudo usermod -aG docker $USER # 현재 접속중인 사용자에게 권한주기
    sudo usermod -aG docker vagrant # your-user 사용자에게 권한주기
    sudo usermod -aG docker root # your-user 사용자에게 권한주기

1-2 docker 설치확인
    docker version

1-3 kubectl 설치
    cd /usr/local/bin \ && sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl \ && sudo chmod +x kubectl \ && kubectl version –client
    Client Version: version.Info{Major:”1″, Minor:”17″, GitVersion:”v1.17.0″, GitCommit:”70132b0f130acc0bed193d9ba59dd186f0e634cf”, GitTreeState:”clean”, BuildDate:”2019-12-07T21:20:10Z”, GoVersion:”go1.13.4″, Compiler:”gc”, Platform:”linux/amd64″}

104 minikube 설치
    sudo mkdir -p /usr/local/bin \
    && cd /usr/local/bin \
    && sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && sudo chmod +x minikube \

    # minikube version
    minikube version: v1.32.0
    commit: 8220a6eb95f0a4d75f7f2d7b14cef975f050512d

1-5 minikube 실행
    minikube start –cpus 2 –memory 6000

1-6.minikube 확인
    minikube status
        minikube
        type: Control Plane
        host: Running
        kubelet: Running
        apiserver: Running
        kubeconfig: Configured

1-7 minikube 설치확인
    kubectl run –generator=deployment/apps.v1 is DEPRECATED and will be removed in a future version. Use kubectl run –generator=run-pod/v1 or kubectl create instead.
    deployment.apps/test created

    # kubectl get deployment
    NAME   READY   UP-TO-DATE   AVAILABLE   AGE
    test   1/1     1            1           15s

    # kubectl get pods
    NAME                    READY   STATUS    RESTARTS   AGE
    test-7cbcb54c89-8k8bd   1/1     Running   0          19s

    # kubectl describe pod test 상세 확인