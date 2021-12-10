azuread_groups = {
  level0 = {
    name                   = "caf-level0"
    prevent_duplicate_name = true
    members = {
      service_principal_keys = ["app0"]
    }
  }
  mgmt = {
    name                   = "caf-mgmt"
    prevent_duplicate_name = true
    members = {
      service_principal_keys = ["mgmt"]
    }
  }
}
