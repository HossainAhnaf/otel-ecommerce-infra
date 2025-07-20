variable "prefix" {
  type        = string
  description = "Prefix"
}
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}


variable "sku_tier" {
  type        = string
  description = "Sku tier"
}

variable "node_pool" {
  type = object({
    name       = string
    node_count = number
    vm_size    = string
    max_pods   = number
  })
  description = "Node pool"
}
