kubectl exec -it $(kubectl get pods -n kube-logging | grep elasticsearch-client | sed -n 1p | awk '{print $1}') -n kube-logging -- bin/elasticsearch-setup-passwords auto -b
