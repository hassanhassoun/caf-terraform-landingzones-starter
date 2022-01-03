
keyvaults = {
  level0 = {
    name               = "caf-mgmt-cc-000"
    resource_group_key = "level0"
    sku_name           = "standard"
    tags = {
      tfstate         = "level0"
      environment     = "sandpit"
      caf_tfstate     = "level0"
      caf_environment = "sandpit"
    }

    creation_policies = {
      caf_platform_maintainers = {
        azuread_group_key  = "caf_platform_maintainers"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      management = {
        azuread_group_key  = "management"
        secret_permissions = ["Get", "List"]
      }
    }

  }

  level1 = {
    name               = "caf-mgmt-cc-001"
    resource_group_key = "level1"
    sku_name           = "standard"
    tags = {
      tfstate         = "level1"
      environment     = "sandpit"
      caf_tfstate     = "level1"
      caf_environment = "sandpit"
    }

    creation_policies = {
      caf_platform_maintainers = {
        azuread_group_key  = "caf_platform_maintainers"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level2 = {
    name               = "caf-mgmt-cc-002"
    resource_group_key = "level2"
    sku_name           = "standard"
    tags = {
      tfstate         = "level2"
      environment     = "sandpit"
      caf_tfstate     = "level2"
      caf_environment = "sandpit"
    }

    creation_policies = {
      caf_platform_maintainers = {
        azuread_group_key  = "caf_platform_maintainers"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  management = {
    name               = "caf-mgmt-cc-003"
    resource_group_key = "level1"
    sku_name           = "standard"

    creation_policies = {
      caf_platform_maintainers = {
        azuread_group_key  = "caf_platform_maintainers"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      management = {
        azuread_group_key  = "management"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }
}
