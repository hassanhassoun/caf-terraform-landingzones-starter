global_prefix_passthrough = true
azure_devops = {

  url     = "https://dev.azure.com/hassanhassoun0672/"
  project = "mxx"

  # PAT Token should be updated manually to the keyvault after running launchpad
  pats = {
    admin = {
      secret_name  = "azdo-pat-admin"
      lz_key       = "launchpad"
      keyvault_key = "level0"
    }
  }

  service_endpoints = {
    launchpad_service_connection = {
      endpoint_name       = "Hassan Hassoun Sandpit"
      subscription_name   = "Hassan Hassoun Sandpit"
      subscription_id     = "e59609a0-4cb2-4567-923e-ea8abc260726"
      aad_app_key         = "devops"
      secret_keyvault_key = "devops"
    }
  }

  variable_groups = {
    global = {
      name         = "release-global-dev" # changing that name requires to change it in the devops agents yaml variables group
      allow_access = true
      variables = {
        HOME_FOLDER_USER    = "vsts_azpcontainer"
        ROVER_IMAGE         = "aztfmod/rover:1.0.11-2112.0809"
        ROVER_RUNNER        = "true"
        TF_CLI_ARGS         = "'-no-color'"
        TF_CLI_ARGS_init    = ""
        TF_CLI_ARGS_plan    = "'-input=false'"
        TF_VAR_ARGS_destroy = "'-auto-approve -refresh=false'"
        ENVIRONMENT         = "sandpit"
        LANDINGZONE_BRANCH  = "hhh"
        LAUNCHPAD_SWITCH    = ""
        CONFIGURATION_ROOT  = "presto"
      }
    }

    level0 = {
      name         = "release-level0"
      allow_access = true
      variables = {
        TF_VAR_pipeline_level = "level0"
        ARM_USE_MSI           = "false"
      }
    }
    level1 = {
      name         = "release-level1"
      allow_access = true
      variables = {
        TF_VAR_pipeline_level = "level1"
        ARM_USE_MSI           = "false"
      }
    }
    level2 = {
      name         = "release-level2"
      allow_access = true
      variables = {
        TF_VAR_pipeline_level = "level2"
        ARM_USE_MSI           = "false"
      }
    }

    # Connectivity
    connectivity_client_id = {
      name         = "connectivity-client-id"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "connectivity"
        serviceendpoint_key = "launchpad_service_connection"
      }
      variables = {
        name = "caf-launchpad-client-id"
      }
    }
    connectivity_client_secret = {
      name         = "connectivity-client-secret"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "connectivity"
        serviceendpoint_key = "launchpad_service_connection"
      }
      variables = {
        name = "caf-launchpad-client-secret"
      }
    }
    connectivity_tenant_id = {
      name         = "connectivity-tenant-id"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "connectivity"
        serviceendpoint_key = "launchpad_service_connection"
      }
      variables = {
        name = "caf-launchpad-tenant-id"
      }
    }
    connectivity_subscription_id = {
      name         = "connectivity-subscription-id"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "connectivity"
        serviceendpoint_key = "launchpad_service_connection"
      }
      variables = {
        name = "subscription-id"
      }
    }

    # Management
    management_client_id = {
      name         = "management-client-id"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "management"
        serviceendpoint_key = "launchpad_service_connection"
      }
      variables = {
        name = "caf-launchpad-client-id"
      }
    }
    management_client_secret = {
      name         = "management-client-secret"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "management"
        serviceendpoint_key = "launchpad_service_connection"
      }
      variables = {
        name = "caf-launchpad-client-secret"
      }
    }
    management_tenant_id = {
      name         = "management-tenant-id"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "management"
        serviceendpoint_key = "launchpad_service_connection"
      }
      variables = {
        name = "caf-launchpad-tenant-id"
      }
    }
    management_subscription_id = {
      name         = "management-subscription-id"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "management"
        serviceendpoint_key = "launchpad_service_connection"
      }
      variables = {
        name = "subscription-id"
      }
    }

    tfstate_subscription = {
      name         = "tfstate-subscription"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "level0"
        serviceendpoint_key = "launchpad_service_connection"
      }
      variables = {
        name = "tfstate-subscription-id"
      }
    }

  }

  pipelines = {
    caf_management_plan = {
      name                = "prz_non_prod_management_plan"
      folder              = "\\configuration\\level1"
      yaml                = ".pipelines/pipeline.yaml"
      repo_type           = "TfsGit"
      git_repo_name       = "pipelines"
      branch_name         = "refs/heads/main"
      variable_group_keys = ["global", "level1", "management_client_id", "management_client_secret", "management_tenant_id", "management_subscription_id", "tfstate_subscription"]
      variables = {
        landingZoneName           = "caf_solution",
        buildName                 = "management",
        level                     = "level1",
        tfAction                  = "plan",
        configurationSubdirectory = "management",
      }
    }
    caf_connectivity_plan = {
      name                = "prz_non_prod_connectivity_plan"
      folder              = "\\configuration\\level2"
      yaml                = ".pipelines/pipeline.yaml"
      repo_type           = "TfsGit"
      git_repo_name       = "pipelines"
      branch_name         = "refs/heads/main"
      variable_group_keys = ["global", "level2", "connectivity_client_id", "connectivity_client_secret", "connectivity_tenant_id", "connectivity_subscription_id", "tfstate_subscription"]
      variables = {
        landingZoneName           = "caf_solution",
        buildName                 = "connectivity_non_prod_hubs",
        level                     = "level2",
        tfAction                  = "plan",
        configurationSubdirectory = "connectivity/non_prod/hubs/",
      }
    }
  }
  apply_pipelines = {
    caf_management_apply = {
      name                = "prz_non_prod_management_apply"
      folder              = "\\configuration\\level1"
      yaml                = ".pipelines/pipeline.yaml"
      repo_type           = "TfsGit"
      git_repo_name       = "pipelines"
      branch_name         = "refs/heads/main"
      variable_group_keys = ["global", "level1", "management_client_id", "management_client_secret", "management_tenant_id", "management_subscription_id", "tfstate_subscription"]
      variables = {
        landingZoneName           = "caf_solution",
        buildName                 = "management",
        level                     = "level1",
        tfAction                  = "apply",
        configurationSubdirectory = "management",
        planID                    = { plan_key = "caf_management_plan" },
      }
    }
    caf_connectivity_apply = {
      name                = "prz_non_prod_connectivity_apply"
      folder              = "\\configuration\\level2"
      yaml                = ".pipelines/pipeline.yaml"
      repo_type           = "TfsGit"
      git_repo_name       = "pipelines"
      branch_name         = "refs/heads/main"
      variable_group_keys = ["global", "level2", "connectivity_client_id", "connectivity_client_secret", "connectivity_tenant_id", "connectivity_subscription_id", "tfstate_subscription"]
      variables = {
        landingZoneName           = "caf_solution",
        buildName                 = "connectivity_non_prod_hubs",
        level                     = "level2",
        tfAction                  = "apply",
        configurationSubdirectory = "connectivity/non_prod/hubs/",
        planID                    = { plan_key = "caf_connectivity_plan" },
      }
    }
  }
}
