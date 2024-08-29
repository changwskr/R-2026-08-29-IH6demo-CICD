kubectl logs -f -n kube-logging $(kubectl get pods -n kube-logging | grep elasticsearch-master | sed -n 1p | awk '{print $1}') | grep "Cluster health status changed from \[YELLOW\] to \[GREEN\]"
