azuread_groups = {
  caf_platform_maintainers = {
    name                   = "caf-platform-maintainers"
    description            = "High privileged group to run all CAF deployments from vscode. Can be used to bootstrap or troubleshoot deployments."
    prevent_duplicate_name = true
  }

  caf_platform_contributors = {
    name                   = "caf-platform-contributors"
    description            = "Can only execute terraform plans for level1 and level2. They can test platform improvements and propose PR."
    prevent_duplicate_name = true
  }

  level0 = {
    name                   = "caf-level0"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["level0"]
    }
  }

  eslz = {
    name                   = "caf-eslz"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["eslz"]
    }
  }

  identity = {
    name                   = "caf-identity"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["identity"]
    }
  }

  management = {
    name                   = "caf-management"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["management"]
    }
  }

  connectivity = {
    name                   = "caf-connectivity"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["connectivity"]
    }
  }

  subscription_creation_platform = {
    name                   = "caf-subscription_creation_platform"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["subscription_creation_platform"]
    }
  }

  subscription_creation_landingzones = {
    name                   = "caf-subscription_creation_landingzones"
    prevent_duplicate_name = true
    members = {
      azuread_service_principal_keys = ["subscription_creation_landingzones"]
    }
  }

}
