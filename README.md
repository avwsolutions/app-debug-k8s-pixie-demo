# app-debug-k8s-pixie-demo
Demo deployment for application debugging and Kubernetes observability with Pixie

## Setup your Pixie environment

Look into the `terraform` folder to deploy a GKE playground-cluster.

### Install pixie CLI

```
bash -c "$(curl -fsSL https://withpixie.ai/install.sh)"
```

### Check cluster checks

```
px deploy --check_only
```

### Create deployment key

```
px auth login
px deploy-key create
```

### Add helm repo and kick-off deployment

```
# add the Pixie Operator
helm repo add pixie-operator https://pixie-operator-charts.storage.googleapis.com
# get latest information about Pixie chart
helm repo update
# install the Pixie chart
helm install pixie pixie-operator/pixie-operator-chart --set deployKey=<deploy-key-goes-here> --set clusterName=playground-cluster --namespace pl --create-namespace
```

### Check if everything is running as expected

```
# Check Pixie Platform status
px get viziers
# Check PEM stats
px get pems
```

## Running example-scripts

### List cluster scripts
```
px run -l
```

### Run cluster scripts
```
px run px/namespaces
```

### Run scripts
```
cd example-scripts
px run -f show_conns.pxl
px run -f show_tables.pxl
```

### Live scripts
```
cd example-scripts
px live -f show_conns.pxl
px live -f show_tables.pxl
```

## Running tracepoint-scripts

### Tracepoint scripts
```
cd tracepoint-scripts
# Sometimes run twice
px run -f sleepy_snoop.pxl
px run px/tracepoint_status
# Works, but trows an error due missing px.display()
px run -f delete_tracepoint.pxl
```

### Build and deploy example memleak-app
```
cd memleak
docker build -t <your docker hub>/memleak:1.0 .
kubectl apply -f memleak-app.yaml
```

More information read my blog at Medium