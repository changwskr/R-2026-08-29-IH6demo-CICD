set -x

echo "default namespace 치환 : kubectl config"

kubectl config --help
kubectl config view
kubectl config set-context ingress-admin@kubernetes --cluster=kubernetes --user=kubernetes-admin --namespace=ingress-nginx
kubectl config view
kubectl config use-context ingress-admin@kubernetes
kubectl config current-context

kubectl get all
kubectl apply -f mavel-home.yaml -f pay.yaml
