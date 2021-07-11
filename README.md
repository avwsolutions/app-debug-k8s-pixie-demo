# app-debug-k8s-pixie-demo
Demo deployment for application debugging and Kubernetes observability with Pixie



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
# add the Pixie chart
helm repo add pixie https://pixie-helm-charts.storage.googleapis.com
# get latest information about Pixie chart
helm repo update
# install the Pixie chart
helm install pixie pixie/pixie-chart --set deployKey=<deploy-key-goes-here>
```


# Check Pixie Platform status
px get viziers
# Check PEM stats
px get pems

cluster name
namespace to deploy

