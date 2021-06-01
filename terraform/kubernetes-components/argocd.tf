resource "helm_release" "argocd" {
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  name = "argocd"
  version = "3.1.1"
  namespace = kubernetes_namespace.argocd.metadata[0].name
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}