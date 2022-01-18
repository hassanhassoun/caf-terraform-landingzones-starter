azuread_groups = {
  management = {
    name                   = "prz-plfm-ops-caf-management"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["management"]
    }
  }

  connectivity = {
    name                   = "prz-plfm-ops-caf-connectivity"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["connectivity"]
    }
  }
}
