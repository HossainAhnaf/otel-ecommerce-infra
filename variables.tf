variable "prefix" {
  type        = string
  description = "value for prefix"
}

variable "sku_tier" {
  type        = string
  description = "value for sku tier"
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
