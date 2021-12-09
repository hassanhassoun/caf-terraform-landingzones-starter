landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level1"
  key                 = "devops"
  tfstates = {
    launchpad = {
      level   = "lower"
      tfstate = "launchpad.tfstate"
    }
  }
}

resource_groups = {
  rg1 = {
    name = "devops-agents-security"
  }
}

keyvaults = {
  devops = {
    name               = "devops"
    resource_group_key = "rg1"
    sku_name           = "standard"

    creation_policies = {
      level0 = {
        azuread_group_key  = "level0"
        lz_key = "launchpad"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }
}

keyvault_access_policies_azuread_apps = {
  level0 = {
    devops = {
      keyvault_lz_key    = "launchpad"
      azuread_app_key    = "devops"
      secret_permissions = ["Get", "List"]
    }
  }
  level1 = {
    devops = {
      keyvault_lz_key    = "launchpad"
      azuread_app_key    = "devops"
      secret_permissions = ["Get", "List"]
    }
  }
  level2 = {
    devops = {
      keyvault_lz_key    = "launchpad"
      azuread_app_key    = "devops"
      secret_permissions = ["Get", "List"]
    }
  }
}


azuread_apps = {
  devops = {
    useprefix               = true
    application_name        = "devops"
    password_expire_in_days = 60
    tenant_name             = "hassanhassounsandpit.onmicrosoft.com"
    keyvaults = {
      devops = {
        secret_prefix = "devops"
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
            keys = ["devops"]
          }
        }
      }
    }
  }
}
