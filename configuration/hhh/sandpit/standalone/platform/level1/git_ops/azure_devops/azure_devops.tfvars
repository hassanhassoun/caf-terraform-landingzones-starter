
azure_devops = {

  url     = "https://dev.azure.com/hassanhassoun0672/"
  project = "hhh"

  # PAT Token should be updated manually to the keyvault after running launchpad
  pats = {
    admin = {
      secret_name  = "azdo-pat-admin"
      lz_key       = "launchpad"
      keyvault_key = "level0"
    }
  }

  service_endpoints = {
    hhh = {
      endpoint_name       = "Hassan Hassoun Sandpit"
      subscription_name   = "Hassan Hassoun Sandpit"
      subscription_id     = "e59609a0-4cb2-4567-923e-ea8abc260726"
      aad_app_key         = "hhh_devops"
      secret_keyvault_key = "devops"
    }
  }

  variable_groups = {
    global = {
      name         = "release-global" # changing that name requires to change it in the devops agents yaml variables group
      allow_access = true
      variables = {
        HOME_FOLDER_USER    = "vsts_azpcontainer"
        ROVER_IMAGE         = "aztfmod/rover:0.14.11-2104.2711"
        ROVER_RUNNER        = "true"
        TF_CLI_ARGS         = "'-no-color'"
        TF_CLI_ARGS_init    = ""
        TF_CLI_ARGS_plan    = "'-input=false'"
        TF_VAR_ARGS_destroy = "'-auto-approve -refresh=false'"
        ENVIRONMENT         = "sandpit"
        LANDINGZONE_BRANCH  = "2104.3"
      }
    }

    level1 = {
      name         = "release-level1"
      allow_access = true
      variables = {
        TF_VAR_pipeline_level = "level1"
        ARM_USE_MSI           = "true"
        AGENT_POOL            = "caf-sandpit-level1"
      }
    }

    level1_kv = {
      name         = "release-level1-sp"
      allow_access = true
      keyvault = {
        lz_key              = "launchpad"
        keyvault_key        = "level0"
        serviceendpoint_key = "hhh"
      }
      variables = {
        name = "tenant-id"
      }
    }

  }

  pipelines = {
    caf_foundations_plan = {
      name          = "caf_foundations_plan"
      folder        = "\\configuration\\level1"
      yaml          = "configuration/sandpit/pipelines/pipeline.yaml"
      repo_type     = "TfsGit"
      git_repo_name = "caf-configuration"
      branch_name = "starter"
      variable_group_keys = ["global", "level1", "level1_kv"]
      variables = {
          landingZoneName = "caf_solution",
          buildName = "foundations",
          level = "level1",
          tfAction = "plan",
          configurationSubdirectory = "",
      }
    }
  }
}
