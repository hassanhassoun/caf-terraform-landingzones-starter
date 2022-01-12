keyvault_access_policies = {
  # A maximum of 16 access policies per keyvault
  level1 = {
    management = {
      azuread_group_key  = "management"
      secret_permissions = ["Get"]
    }
  }
  # A maximum of 16 access policies per keyvault
  level2 = {
    connectivity = {
      azuread_group_key  = "connectivity"
      secret_permissions = ["Get"]
    }
    management = {
      azuread_group_key  = "management"
      secret_permissions = ["Get"]
    }
  }

}
