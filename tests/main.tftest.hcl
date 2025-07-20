# --------------------------------------------------------------------------
# NOTE:
# This test is intended solely for CI/CD pipeline demonstration purposes.
# Comprehensive and production-ready tests will be authored at a later stage.
# --------------------------------------------------------------------------

run "demo_plan" {
  command = plan

  assert {
    condition     = local.aks_cluster_name == "otel-ecommerce-${terraform.workspace}-aks"
    error_message = "AKS cluster name does not match expected pattern: otel-ecommerce-${terraform.workspace}-aks"
  }
}
