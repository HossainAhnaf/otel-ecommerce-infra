
output "cluster_credentials_download_command" {
  value       = module.aks_cluster.cluster_credentials_download_command
  description = "Cluster credentials download command"
}
