# --------------------------------------------------------------------------
# NOTE:
# This test is intended solely for CI/CD pipeline demonstration purposes.
# Comprehensive and production-ready tests will be authored at a later stage.
# --------------------------------------------------------------------------

run "demo_plan" {
  command = plan

  assert {
    condition     = local.location == "East US"
    error_message = "location should be East US"
  }
}
