locals {

  value_files = {
    server = {
      config = {
        repositories = yamlencode([
          {
            url = var.repository
          }
        ])
      }
    }
  }
}
resource "helm_release" "argocd" {
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  name = "argocd"
  version = "3.1.1"
  namespace = kubernetes_namespace.argocd.metadata[0].name
  values = [yamlencode(local.value_files)]
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}