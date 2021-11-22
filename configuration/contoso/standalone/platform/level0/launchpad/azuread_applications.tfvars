azuread_apps = {
  aadapp = {
    useprefix                    = false
    application_name             = "aadapp-caf-launchpad-level0"
    app_role_assignment_required = true
    keyvaults = {
      level0 = {
        secret_prefix = "aadapp-caf-launchpad-level0"
      }
    }
    # Store the ${secret_prefix}-client-id, ${secret_prefix}-client-secret...
    # Set the policy during the creation process of the launchpad
  }
}

azuread_applications = {
  level0 = {
    application_name = "sp-caf-level0"
  }
  identity = {
    application_name = "sp-caf-identity"
  }
  management = {
    application_name = "sp-caf-management"
  }
  eslz = {
    application_name = "sp-caf-eslz"
  }
  connectivity = {
    application_name = "sp-caf-connectivity"
  }
  subscription_creation_platform = {
    application_name = "sp-caf-subscription-creation-platform"
  }
  subscription_creation_landingzones = {
    application_name = "sp-caf-subscription-creation-landingzones"
  }
}
