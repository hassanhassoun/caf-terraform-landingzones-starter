azuread_service_principals = {
  # Manage the deployment of the connectivity services
  connectivity = {
    azuread_application = {
      key = "connectivity"
    }
  }
  # Manage the deployment of the shared services
  management = {
    azuread_application = {
      key = "management"
    }
  }
}

azuread_service_principal_passwords = {
  management = {
    azuread_service_principal = {
      key = "management"
    }
    password_policy = {
      # Length of the password
      length  = 250
      special = false
      upper   = true
      number  = true

      # Define the number of days the password is valid. It must be more than the rotation frequency
      expire_in_days = 100
      rotation = {
        #
        # Set how often the password must be rotated. When passed the renewal time, running the terraform plan / apply will change to a new password
        # Only set one of the value
        #

        # mins = 3 # only recommended for CI and demo
        # days = 7
        months = 1
      }
    }
    keyvaults = {
      management = {
        secret_prefix = "caf-launchpad"
      }
    }
    # Store the ${secret_prefix}-client-id, ${secret_prefix}-client-secret...
    # Set the policy during the creation process of the launchpad
  }

  connectivity = {
    azuread_service_principal = {
      key = "connectivity"
    }
    password_policy = {
      # Length of the password
      length  = 250
      special = false
      upper   = true
      number  = true

      # Define the number of days the password is valid. It must be more than the rotation frequency
      expire_in_days = 100
      rotation = {
        #
        # Set how often the password must be rotated. When passed the renewal time, running the terraform plan / apply will change to a new password
        # Only set one of the value
        #

        # mins = 3 # only recommended for CI and demo
        # days = 7
        months = 1
      }
    }
    keyvaults = {
      connectivity = {
        secret_prefix = "caf-launchpad"
      }
    }
    # Store the ${secret_prefix}-client-id, ${secret_prefix}-client-secret...
    # Set the policy during the creation process of the launchpad
  }
}
