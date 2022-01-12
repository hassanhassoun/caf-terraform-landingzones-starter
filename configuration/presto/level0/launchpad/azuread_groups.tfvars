azuread_groups = {
  management = {
    name                   = "caf-management"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["management"]
    }
  }

  connectivity = {
    name                   = "caf-connectivity"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["connectivity"]
    }
  }
}
