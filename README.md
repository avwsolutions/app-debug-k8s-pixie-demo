# app-debug-k8s-pixie-demo
Demo deployment for application debugging and Kubernetes observability with Pixie

# Setup your Pixie environment

Look into the `terraform` folder to deploy a GKE playground-cluster.

Install pixie CLI

```
bash -c "$(curl -fsSL https://withpixie.ai/install.sh)"
```

Check cluster checks

```
px deploy --check_only
```

Create deployment key

```
px auth login
px deploy-key create
```

Add helm repo and kick-off deployment

```
# add the Pixie Operator
helm repo add pixie-operator https://pixie-operator-charts.storage.googleapis.com
# get latest information about Pixie chart
helm repo update
# install the Pixie chart
helm install pixie pixie-operator/pixie-operator-chart --set deployKey=<deploy-key-goes-here> --set clusterName=playground-cluster --namespace pl --create-namespace
```

Check if everything is running as expected

```
# Check Pixie Platform status
px get viziers
# Check PEM stats
px get pems
```

