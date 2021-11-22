
keyvaults = {
  level0 = {
    name               = "kvprodl0"
    resource_group_key = "level0"
    sku_name           = "standard"
    tags = {
      tfstate         = "level0"
      environment     = "demo"
      caf_tfstate     = "level0"
      caf_environment = "demo"
    }

    creation_policies = {
      caf_platform_maintainers = {
        azuread_group_key  = "caf_platform_maintainers"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level1 = {
    name               = "kvprodl1"
    resource_group_key = "level1"
    sku_name           = "standard"
    tags = {
      tfstate         = "level1"
      environment     = "demo"
      caf_tfstate     = "level1"
      caf_environment = "demo"
    }

    creation_policies = {
      caf_platform_maintainers = {
        azuread_group_key  = "caf_platform_maintainers"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level2 = {
    name               = "kvprodl2"
    resource_group_key = "level2"
    sku_name           = "standard"
    tags = {
      tfstate         = "level2"
      environment     = "demo"
      caf_tfstate     = "level2"
      caf_environment = "demo"
    }

    creation_policies = {
      caf_platform_maintainers = {
        azuread_group_key  = "caf_platform_maintainers"
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }
}
