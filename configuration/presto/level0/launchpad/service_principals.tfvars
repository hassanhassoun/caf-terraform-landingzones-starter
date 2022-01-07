azuread_service_principals = {
  # Manage the deployment of the level0
  level0 = {
    azuread_application = {
      key = "level0"
    }
  }
  # Manage the deployment of the eslz
  eslz = {
    azuread_application = {
      key = "eslz"
    }
  }
  # Manage the deployment of the connectivity
  connectivity = {
    azuread_application = {
      key = "connectivity"
    }
  }
  # Manage the deployment of the management
  management = {
    azuread_application = {
      key = "management"
    }
  }
  # Manage the deployment of the identity
  identity = {
    azuread_application = {
      key = "identity"
    }
  }
  # Manage the deployment of the subscription_creation_platform
  subscription_creation_platform = {
    azuread_application = {
      key = "subscription_creation_platform"
    }
  }
  # Manage the deployment of the subscription_creation_landingzones
  subscription_creation_landingzones = {
    azuread_application = {
      key = "subscription_creation_landingzones"
    }
  }
}

azuread_service_principal_passwords = {
  level0 = {
    azuread_service_principal = {
      key = "level0"
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
      level0 = {
        secret_prefix = "caf-launchpad"
      }
    }
    # Store the ${secret_prefix}-client-id, ${secret_prefix}-client-secret...
    # Set the policy during the creation process of the launchpad
  }

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
}
