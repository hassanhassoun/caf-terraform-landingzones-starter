keyvault_access_policies_azuread_apps = {
  level0 = {
    caf_launchpad_level0 = {
      azuread_app_key    = "caf_launchpad_level0"
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
  }
  level1 = {
    caf_launchpad_level0 = {
      azuread_app_key    = "caf_launchpad_level0"
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
  }
  level2 = {
    caf_launchpad_level0 = {
      azuread_app_key    = "caf_launchpad_level0"
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
  }
  level3 = {
    caf_launchpad_level0 = {
      azuread_app_key    = "caf_launchpad_level0"
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
  }
}

keyvaults = {
  level0 = {
    name               = "l0"
    resource_group_key = "level0"
    sku_name           = "standard"
    tags = {
      tfstate         = "level0"
      environment     = "iit"
      caf_tfstate     = "level0"
      caf_environment = "iit"
    }

    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level1 = {
    name               = "l1"
    resource_group_key = "level1"
    sku_name           = "standard"
    tags = {
      tfstate         = "level1"
      environment     = "iit"
      caf_tfstate     = "level1"
      caf_environment = "iit"
    }

    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level2 = {
    name               = "l2"
    resource_group_key = "level2"
    sku_name           = "standard"
    tags = {
      tfstate         = "level2"
      environment     = "iit"
      caf_tfstate     = "level2"
      caf_environment = "iit"
    }

    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level3 = {
    name               = "l3"
    resource_group_key = "level3"
    sku_name           = "standard"
    tags = {
      tfstate         = "level3"
      environment     = "iit"
      caf_tfstate     = "level3"
      caf_environment = "iit"
    }

    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level4 = {
    name               = "l4"
    resource_group_key = "level4"
    sku_name           = "standard"
    tags = {
      tfstate         = "level4"
      environment     = "iit"
      caf_tfstate     = "level4"
      caf_environment = "iit"
    }

    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

}
