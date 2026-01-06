output "cluster_name" {
  value = module.gke_cluster.name
}
output "cluster_endpoint" {
  value = module.gke_cluster.config_host
}

output "cluster_ca" {
  value = module.gke_cluster.config_ca
}

output "cluster_token" {
  value     = module.gke_cluster.config_token
  sensitive = true
}
