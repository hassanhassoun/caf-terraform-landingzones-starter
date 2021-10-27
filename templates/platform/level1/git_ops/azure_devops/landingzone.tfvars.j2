landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level1"
  key                 = "azdo-hhh"
  tfstates = {
    launchpad = {
      level   = "lower"
      tfstate = "caf_launchpad.tfstate"
    }
  }
}

resource_groups = {
  rg1 = {
    name = "devops-agents-security"
  }
}

# need to add logged in user

keyvaults = {
  devops = {
    name               = "devops"
    resource_group_key = "rg1"
    sku_name           = "standard"

    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }
}

keyvault_access_policies_azuread_apps = {
  level0 = {
    hhh_devops = {
      keyvault_lz_key    = "launchpad"
      azuread_app_key    = "hhh_devops"
      secret_permissions = ["Get", "List"]
    }
  }
  level1 = {
    hhh_devops = {
      keyvault_lz_key    = "launchpad"
      azuread_app_key    = "hhh_devops"
      secret_permissions = ["Get", "List"]
    }
  }
  level2 = {
    hhh_devops = {
      keyvault_lz_key    = "launchpad"
      azuread_app_key    = "hhh_devops"
      secret_permissions = ["Get", "List"]
    }
  }
  level3 = {
    hhh_devops = {
      keyvault_lz_key    = "launchpad"
      azuread_app_key    = "hhh_devops"
      secret_permissions = ["Get", "List"]
    }
  }
  level4 = {
    hhh_devops = {
      keyvault_lz_key    = "launchpad"
      azuread_app_key    = "hhh_devops"
      secret_permissions = ["Get", "List"]
    }
  }
}


azuread_apps = {

  hhh_devops = {
    useprefix               = true
    application_name        = "caf-level4-hhh"
    password_expire_in_days = 60
    tenant_name             = "change_with_your_tenant_name.onmicrosoft.com"
    keyvaults = {
      devops = {
        secret_prefix = "aadapp-caf-launchpad-level0"
      }
    }
  }

}

custom_role_definitions = {

  caf-azdo-to-azure-subscription = {
    name        = "caf-azure-devops-TO-azure-subscription"
    useprefix   = true
    description = "CAF Custom role for service principal in Azure Devops to access resources"
    permissions = {
      actions = [
        "Microsoft.Resources/subscriptions/read",
        "Microsoft.KeyVault/vaults/read"
      ]
    }
  }

}


role_mapping = {
  custom_role_mapping = {
    subscriptions = {
      logged_in_subscription = {
        "caf-azdo-to-azure-subscription" = {
          azuread_apps = {
            keys = ["hhh_devops"]
          }
        }
      }
    }
  }
}
