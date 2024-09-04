https://pyrasis.com/jHLsAlwaysUpToDateKubernetes/Unit06/02

https://github.com/joneconsulting/k8s/blob/master/install/kubernetes_install.md


미니쿠버 설치 사이트
https://idchowto.com/ubuntu-22-04-minikube-%EC%84%A4%EC%B9%98kubectldockerkubernetes/

#----------------
ubuntu 22.04 minikube 설치
현우 이 2024년 01월 11일 IT기타 0 댓글


minikube
minikube kubernetes는
macOS, Linux 및 Windows에서 로컬 Kubernetes 클러스터를 신속하게 설정합니다.

애플리케이션 개발자와 새로운 Kubernetes 사용자를 돕는 데 중점을 둡니다.minikube kubernetes docker

공식문서

0.minikube사전준비
0-1. 테스트 사양
Spec : 4Core 8Memory
Os : Ubuntu 22.04
0-2. 준비
2vCore CPU
2GB Memory
20GB Free Disk
컨테이너를 실행하기 위한 런타임 환경(Docker 등)
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
1-1.계정 설정
sudo usermod -aG docker $USER # 현재 접속중인 사용자에게 권한주기
sudo usermod -aG docker your-user # your-user 사용자에게 권한주기


# docker version
Client: Docker Engine – Community
 Version:           24.0.7
 API version:       1.43
 Go version:        go1.20.10
 Git commit:        afdd53b
 Built:             Thu Oct 26 09:07:41 2023
 OS/Arch:           linux/amd64
 Context:           default
Server: Docker Engine – Community
 Engine:
  Version:          24.0.7
  API version:      1.43 (minimum version 1.12)
  Go version:       go1.20.10
  Git commit:       311b9ff
  Built:            Thu Oct 26 09:07:41 2023
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.26
  GitCommit:        3dd1e886e55dd695541fdcd67420c2888645a495
 runc:
  Version:          1.1.10
  GitCommit:        v1.1.10-0-g18a0cb0
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0


2.Kubectl
cd /usr/local/bin \ && sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl \ && sudo chmod +x kubectl \ && kubectl version –client
Client Version: version.Info{Major:”1″, Minor:”17″, GitVersion:”v1.17.0″, GitCommit:”70132b0f130acc0bed193d9ba59dd186f0e634cf”, GitTreeState:”clean”, BuildDate:”2019-12-07T21:20:10Z”, GoVersion:”go1.13.4″, Compiler:”gc”, Platform:”linux/amd64″}



3.Minikube
sudo mkdir -p /usr/local/bin \
&& cd /usr/local/bin \
&& sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& sudo chmod +x minikube \
# minikube version
minikube version: v1.32.0
commit: 8220a6eb95f0a4d75f7f2d7b14cef975f050512d

3-1.minikube 실행
# minikube start –cpus 2 –memory 6000

…

🏄  Done! kubectl is now configured to use “minikube” cluster and “default” namespace by default

3-2.minikube 확인
# minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured


minikube 설치는 완료 입니다.

3-3. minikube 테스트
# kubectl run test –image=nginx
kubectl run –generator=deployment/apps.v1 is DEPRECATED and will be removed in a future version. Use kubectl run –generator=run-pod/v1 or kubectl create instead.
deployment.apps/test created
# kubectl get deployment
NAME   READY   UP-TO-DATE   AVAILABLE   AGE
test   1/1     1            1           15s

# kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
test-7cbcb54c89-8k8bd   1/1     Running   0          19s

# kubectl describe pod test 상세 확인
—



4.minikube ingress 설치
# minikube addons enable ingress
💡  ingress is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
    ▪ Using image registry.k8s.io/ingress-nginx/kube-webhook-certgen:v20231011-8b53cabe0
    ▪ Using image registry.k8s.io/ingress-nginx/kube-webhook-certgen:v20231011-8b53cabe0
    ▪ Using image registry.k8s.io/ingress-nginx/controller:v1.9.4
🔎  Verifying ingress addon…
🌟  The ‘ingress’ addon is enabled
4-1.minikube worker 노드 생성
# kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   22m   v1.28.3

# minikube node add –worker
😄  Adding node m02 to cluster minikube
❗  Cluster was created without any CNI, adding a node to it might cause broken networking.
👍  Starting worker node minikube-m02 in cluster minikube
🚜  Pulling base image …
🔥  Creating docker container (CPUs=2, Memory=2200MB) …
🐳  Preparing Kubernetes v1.28.3 on Docker 24.0.7 …
🔎  Verifying Kubernetes components…
🏄  Successfully added m02 to minikube!

# kubectl get nodes -o wide
NAME           STATUS   ROLES                  AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
minikube       Ready    control-plane   31m   v1.28.3   192.168.49.2   <none>        Ubuntu 22.04.3 LTS   5.15.0-87-generic   docker://24.0.7
minikube-m02   Ready    <none>                 12s   v1.28.3   192.168.49.3   <none>        Ubuntu 22.04.3 LTS   5.15.0-87-generic   docker://24.0.7



접속 테스트

# minikube ssh -n minikube-m02
docker@minikube-m02:~$

이상 minikube 설치였습니다.

kubernetes 설치

