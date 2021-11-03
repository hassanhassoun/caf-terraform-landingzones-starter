
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
    mxx = {
      endpoint_name       = "Hassan Hassoun Sandbox"
      subscription_name   = "Hassan Hassoun Sandbox"
      subscription_id     = "89cbdaf0-0e38-4cc2-a186-554fa353aaeb"
      aad_app_key         = "mxx_devops"
      secret_keyvault_key = "devops"
    }
  }

  variable_groups = {
    global = {
      name         = "release-global-iit" # changing that name requires to change it in the devops agents yaml variables group
      allow_access = true
      variables = {
        HOME_FOLDER_USER    = "vsts_azpcontainer"
        ROVER_IMAGE         = "aztfmod/rover-preview:1.0.9-2110.200507"
        ROVER_RUNNER        = "true"
        TF_CLI_ARGS         = "'-no-color'"
        TF_CLI_ARGS_init    = ""
        TF_CLI_ARGS_plan    = "'-input=false'"
        TF_VAR_ARGS_destroy = "'-auto-approve -refresh=false'"
        ENVIRONMENT         = "iit"
        LANDINGZONE_BRANCH  = "master"
      }
    }

    level1 = {
      name         = "release-level1-iit"
      allow_access = true
      variables = {
        TF_VAR_pipeline_level = "level1"
        ARM_USE_MSI           = "true"
        AGENT_POOL            = "caf-iit-level1"
      }
    }
    level2 = {
      name         = "release-level2-iit"
      allow_access = true
      variables = {
        TF_VAR_pipeline_level = "level2"
        ARM_USE_MSI           = "true"
        AGENT_POOL            = "caf-iit-level2"
      }
    }
    level3 = {
      name         = "release-level3-iit"
      allow_access = true
      variables = {
        TF_VAR_pipeline_level = "level3"
        ARM_USE_MSI           = "true"
        AGENT_POOL            = "caf-iit-level3"
      }
    }
    level1_client_id = {
      name         = "release-level1-iit-client-id"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "level0"
        serviceendpoint_key = "mxx"
      }
      variables = {
        name = "aadapp-caf-launchpad-level0-client-id"
      }
    }
    level1_client_secret = {
      name         = "release-level1-iit-client-secret"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "level0"
        serviceendpoint_key = "mxx"
      }
      variables = {
        name = "aadapp-caf-launchpad-level0-client-secret"
      }
    }
    level1_tenant_id = {
      name         = "release-level1-iit-tenant-id"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "level0"
        serviceendpoint_key = "mxx"
      }
      variables = {
        name = "aadapp-caf-launchpad-level0-tenant-id"
      }
    }

    level1_sp_subscription = {
      name         = "release-level1-sp-subscription-iit"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "level0"
        serviceendpoint_key = "mxx"
      }
      variables = {
        name = "subscription-id"
      }
    }

  }

  pipelines = {
    caf_management_plan = {
      name                = "mxx_iit_management_plan"
      folder              = "\\configuration\\level1"
      yaml                = ".pipelines/pipeline.yaml"
      repo_type           = "TfsGit"
      git_repo_name       = "pipelines"
      branch_name         = "main"
      variable_group_keys = ["global", "level1", "level1_client_id", "level1_client_secret", "level1_tenant_id", "level1_sp_subscription"]
      variables = {
        landingZoneName           = "caf_solution",
        buildName                 = "management",
        level                     = "level1",
        tfAction                  = "plan",
        configurationSubdirectory = "",
      }
    }
  }
  apply_pipelines = {
    caf_management_apply = {
      name                = "mxx_iit_management_apply"
      folder              = "\\configuration\\level1"
      yaml                = ".pipelines/pipeline.yaml"
      repo_type           = "TfsGit"
      git_repo_name       = "pipelines"
      branch_name         = "main"
      variable_group_keys = ["global", "level1", "level1_client_id", "level1_client_secret", "level1_tenant_id", "level1_sp_subscription"]
      variables = {
        landingZoneName           = "caf_solution",
        buildName                 = "management",
        level                     = "level1",
        tfAction                  = "apply",
        configurationSubdirectory = "",
        planID                    = { plan_key = "caf_management_plan" },
      }
    }
  }
}
