
#
# Services supported: subscriptions, storage accounts and resource groups
# Can assign roles to: AD groups, AD object ID, AD applications, Managed identities
#

role_mapping = {
  built_in_role_mapping = {
    management_group = {
      root = {
        "User Access Administrator" = {
          logged_in = {
            keys = ["user"]
          }
          azuread_apps = {
            keys = ["caf_launchpad_level0"]
          }
        }
        "Management Group Contributor" = {
          azuread_apps = {
            keys = ["caf_launchpad_level0"]
          }
          logged_in = {
            keys = ["user"]
          }
        }
        "Owner" = {
          logged_in = {
            keys = ["user"]
          }
          azuread_apps = {
            keys = ["caf_launchpad_level0"]
          }
        }
      }
    }


    storage_accounts = {
      level0 = {
        "Storage Blob Data Contributor" = {
          azuread_apps = {
            keys = ["caf_launchpad_level0"]
          }
          logged_in = {
            keys = ["user"]
          }
        }
      }

      level1 = {
        "Storage Blob Data Contributor" = {
          azuread_apps = {
            keys = ["caf_launchpad_level0"]
          }
          logged_in = {
            keys = ["user"]
          }
        }
      }

      level2 = {
        "Storage Blob Data Contributor" = {
          azuread_apps = {
            keys = ["caf_launchpad_level0"]
          }
          logged_in = {
            keys = ["user"]
          }
        }
      }

      level3 = {
        "Storage Blob Data Contributor" = {
          azuread_apps = {
            keys = ["caf_launchpad_level0"]
          }
          logged_in = {
            keys = ["user"]
          }
        }
      }
    }
  }
}
