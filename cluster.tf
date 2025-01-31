resource "digitalocean_kubernetes_cluster" "k8s" {
    name = var.k8s_name
    region = var.region
    version = var.k8s_version

    node_pool {
        name = "worker-pool"
        size = var.node_size
        node_count = var.node_count
    }
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.k8s.kube_config[0].raw_config
  sensitive = true
}


