prefix   = "otel-ecommerce-dev"
sku_tier = "Free"
node_pool = {
  name       = "default"
  node_count = 1
  vm_size    = "Standard_B1s"
  max_pods   = 50
}

authorized_ip_ranges = ["203.76.123.45/32"]

automatic_upgrade_channel = "patch"
