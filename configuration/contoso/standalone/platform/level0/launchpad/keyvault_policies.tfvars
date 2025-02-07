keyvault_access_policies = {
  # A maximum of 16 access policies per keyvault
  level0 = {
    sp_level0 = {
      azuread_group_key  = "level0"
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
    identity = {
      azuread_group_key  = "identity"
      secret_permissions = ["Get"]
    }
  }

  # A maximum of 16 access policies per keyvault
  level1 = {
    sp_level0 = {
      # Allow level1 devops agent to be managed from agent pool level0
      azuread_group_key  = "level0"
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
    identity = {
      azuread_group_key  = "identity"
      secret_permissions = ["Get"]
    }
    management = {
      azuread_group_key  = "management"
      secret_permissions = ["Get"]
    }
    eslz = {
      azuread_group_key  = "eslz"
      secret_permissions = ["Get"]
    }
    subscription_creation_platform = {
      azuread_group_key  = "subscription_creation_platform"
      secret_permissions = ["Get"]
    }
  }
  # A maximum of 16 access policies per keyvault
  level2 = {
    sp_level0 = {
      azuread_group_key  = "level0"
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
    connectivity = {
      azuread_group_key  = "connectivity"
      secret_permissions = ["Get"]
    }
    identity = {
      azuread_group_key  = "identity"
      secret_permissions = ["Get"]
    }
    management = {
      azuread_group_key  = "management"
      secret_permissions = ["Get"]
    }
  }

}