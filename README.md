# example-nodejs
Just simple nodejs application

## Prerequisite

- Kubernetes Cluster
- Jenkins Instance

## Installation ##
1. Commit and push this repository to remote git.

2. Install Argocd and Inginx Ingress Controller on K8s Cluster
   
create file override.tf under ./terraoform/kubernetes-components with the cluster config to declare Terraform provider for example
```
provider "helm" {
  kubernetes {
    config_context = "${YOUR_LOCAL_K8S_CONTEXT}"
    config_path = "${PATH_TO_YOUR_KUBE_CONFIG_FILE}"
    insecure = true
  }
}

provider "kubernetes" {
  config_context = "${YOUR_LOCAL_K8S_CONTEXT}"
    config_path = "${PATH_TO_YOUR_KUBE_CONFIG_FILE}"
    insecure = true
}


```
    
Apply Terraform script

```
  cd ./terraform/kubernetes-components
  terraform apply --autoapprove
```

Create ArgoCD projects and apps using helm chart provided
```
helm install ./charts/argocd-apps
```

The charts hello-1 and hello-2 will be auto synced and deploy to k8s Cluster
