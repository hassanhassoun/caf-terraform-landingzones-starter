
keyvaults = {
  level0 = {
    name               = "prz-ops-cc-level0"
    resource_group_key = "level0"
    sku_name           = "standard"
    tags = {
      tfstate         = "level0"
      environment     = "sandpit"
      caf_tfstate     = "level0"
      caf_environment = "sandpit"
    }

    creation_policies = {
      logged_in_user  = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      management = {
        azuread_group_key  = "management"
        secret_permissions = ["Get", "List"]
      }
    }

  }

  level1 = {
    name               = "prz-ops-cc-level1"
    resource_group_key = "level1"
    sku_name           = "standard"
    tags = {
      tfstate         = "level1"
      environment     = "sandpit"
      caf_tfstate     = "level1"
      caf_environment = "sandpit"
    }

    creation_policies = {
      logged_in_user  = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level2 = {
    name               = "prz-ops-cc-level2"
    resource_group_key = "level2"
    sku_name           = "standard"
    tags = {
      tfstate         = "level2"
      environment     = "sandpit"
      caf_tfstate     = "level2"
      caf_environment = "sandpit"
    }

    creation_policies = {
      logged_in_user  = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  management = {
    name               = "prz-ops-cc-mgmt"
    resource_group_key = "level1"
    sku_name           = "standard"

    creation_policies = {
      logged_in_user  = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      management = {
        azuread_group_key  = "management"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }
}
