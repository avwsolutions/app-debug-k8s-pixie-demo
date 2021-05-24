# Create playground cluster

This project uses `Google Kubernetes Engine` (**GKE**) to provide playground resources. The `Terraform` code is created to deploy here.

## Prerequisites

- Terraform 0.13 or higher
- Azure Provider 2.57 or higher
- Azure Cloud Platform (**Azure**) account with enough permissions to spin-up a `AKS cluster`

## Create playground cluster steps

### Prepare Gcloud CLI

Ensure that you are logged in from the `az CLI` and set your *default project*.
```
az login
```

### Apply Terraform

First run `terraform plan` to ensure everything is set to `apply`. Advice is to create a `terrraform.tfvars` file to include your specific variables, like the actual `project` and `cluster_name`.

```
terraform plan --var-file=terraform.tfvars
terraform apply --var-file=terraform.tfvars
```

### Import GKE cluster into your local kubectl

Run the following command to import the newly created clusters. Please use your own specified `subscription_id`, `tenant_id` and `cluster_name`.

```
az aks get-credentials --resource-group playground-resources --name playground
```

### Validate kubectl and cluster state

Just some simple check to validate everything is running as expected !

```
kubectl get nodes
kubectl get pods --field-selector status.phase!=Running -A
```

You are now ready to deploy some awesome applications to demostrate !
