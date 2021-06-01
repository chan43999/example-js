resource "helm_release" "internal_nginx_ingress_controller" {
  chart = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  name = "nginx-ingress-controller"
  namespace = kubernetes_namespace.nginx_ingress_controller.metadata[0].name
  atomic = true
  version = "3.29.0"
}

resource "kubernetes_namespace" "nginx_ingress_controller" {
  metadata {
    name = "nginx-ingress-controller"
  }
}
