keyvaults = {
  level0 = {
    name               = "l0"
    resource_group_key = "level0"
    sku_name           = "standard"
    tags = {
      tfstate         = "level0"
      environment     = "demo"
      caf_tfstate     = "level0"
      caf_environment = "demo"
    }

    creation_policies = {
      level0 = {
        azuread_group_key  = "level0"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      mgmt = {
        azuread_group_key  = "mgmt"
        secret_permissions = ["Get", "List"]
      }
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
      environment     = "demo"
      caf_tfstate     = "level1"
      caf_environment = "demo"
    }

    creation_policies = {
      mgmt = {
        azuread_group_key  = "mgmt"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      level0 = {
        azuread_group_key  = "level0"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
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
      environment     = "demo"
      caf_tfstate     = "level2"
      caf_environment = "demo"
    }

    creation_policies = {
      level0 = {
        azuread_group_key  = "level0"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }
  mgmt = {
    name               = "mgmt"
    resource_group_key = "level1"
    sku_name           = "standard"
    tags = {
    }

    creation_policies = {
      level0 = {
        azuread_group_key  = "level0"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      mgmt = {
        azuread_group_key  = "mgmt"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }
}
