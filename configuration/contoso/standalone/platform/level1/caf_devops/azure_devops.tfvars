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
      endpoint_name       = "Hassan Hassoun Sandpit"
      subscription_name   = "Hassan Hassoun Sandpit"
      subscription_id     = "e59609a0-4cb2-4567-923e-ea8abc260726"
      aad_app_key         = "mxx_devops"
      secret_keyvault_key = "devops"
    }
  }

  variable_groups = {
    global = {
      name         = "release-global-dev" # changing that name requires to change it in the devops agents yaml variables group
      allow_access = true
      variables = {
        HOME_FOLDER_USER    = "vsts_azpcontainer"
        ROVER_IMAGE         = "aztfmod/rover:1.0.9-2111.0103"
        ROVER_RUNNER        = "true"
        TF_CLI_ARGS         = "'-no-color'"
        TF_CLI_ARGS_init    = ""
        TF_CLI_ARGS_plan    = "'-input=false'"
        TF_VAR_ARGS_destroy = "'-auto-approve -refresh=false'"
        ENVIRONMENT         = "sandpit"
        LANDINGZONE_BRANCH  = "eslz.0.3.3"
      }
    }

    level1 = {
      name         = "release-level1-dev"
      allow_access = true
      variables = {
        TF_VAR_pipeline_level = "level1"
        ARM_USE_MSI           = "true"
        AGENT_POOL            = "caf-dev-level1"
      }
    }
    level2 = {
      name         = "release-level2-dev"
      allow_access = true
      variables = {
        TF_VAR_pipeline_level = "level2"
        ARM_USE_MSI           = "true"
        AGENT_POOL            = "caf-dev-level2"
      }
    }
    level1_client_id = {
      name         = "release-level1-dev-client-id"
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
      name         = "release-level1-dev-client-secret"
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
      name         = "release-level1-dev-tenant-id"
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
      name         = "release-level1-sp-subscription-dev"
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

    level1_tfstate_subscription = {
      name         = "release-level1-tfstate-subscription-dev"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "level0"
        serviceendpoint_key = "mxx"
      }
      variables = {
        name = "tfstate-subscription-id"
      }
    }

  }

  pipelines = {
    caf_management_plan = {
      name                = "mxx_dev_management_plan"
      folder              = "\\configuration\\level1"
      yaml                = ".pipelines/pipeline.yaml"
      repo_type           = "TfsGit"
      git_repo_name       = "pipelines"
      branch_name         = "main"
      variable_group_keys = ["global", "level1", "level1_client_id", "level1_client_secret", "level1_tenant_id", "level1_sp_subscription", "level1_tfstate_subscription"]
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
      name                = "mxx_dev_management_apply"
      folder              = "\\configuration\\level1"
      yaml                = ".pipelines/pipeline.yaml"
      repo_type           = "TfsGit"
      git_repo_name       = "pipelines"
      branch_name         = "main"
      variable_group_keys = ["global", "level1", "level1_client_id", "level1_client_secret", "level1_tenant_id", "level1_sp_subscription", "level1_tfstate_subscription"]
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
