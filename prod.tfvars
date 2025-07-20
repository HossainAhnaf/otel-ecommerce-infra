prefix   = "otel-ecommerce-prod"
sku_tier = "Free"
node_pool = {
  name       = "default"
  node_count = 3
  vm_size    = "Standard_B2s"
  max_pods   = 100
}

authorized_ip_ranges = ["203.76.123.45/32"]
