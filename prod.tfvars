prefix   = "otel-ecommerce-prod"
sku_tier = "Free"
node_pool = {
  name       = "default"
  node_count = 3
  vm_size    = "Standard_D2s_v3"
  max_pods   = 100
}
