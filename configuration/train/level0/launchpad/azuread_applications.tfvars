azuread_apps = {
  app0 = {
    useprefix                    = true
    application_name             = "caf-launchpad-level0"
    app_role_assignment_required = true
    keyvaults = {
      level0 = {
        secret_prefix = "caf-launchpad"
      }
    }
    # Store the ${secret_prefix}-client-id, ${secret_prefix}-client-secret...
    # Set the policy during the creation process of the launchpad
  }
  mgmt = {
    useprefix                    = true
    application_name             = "caf-mgmt"
    app_role_assignment_required = true
    keyvaults = {
      mgmt = {
        secret_prefix = "caf-launchpad"
      }
    }
  }
}
