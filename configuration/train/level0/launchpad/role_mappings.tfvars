
#
# Services supported: subscriptions, storage accounts and resource groups
# Can assign roles to: AD groups, AD object ID, AD applications, Managed identities
#

role_mapping = {
  built_in_role_mapping = {
    management_group = {
      root = {
        "User Access Administrator" = {
          azuread_groups = {
            keys = ["level0"]
          }
        }
        "Management Group Contributor" = {
          azuread_groups = {
            keys = ["level0"]
          }
        }
        "Storage Blob Data Contributor" = {
          azuread_groups = {
            keys = ["level0"]
          }
        }
        "Owner" = {
          azuread_groups = {
            keys = ["level0"]
          }
        }
      }
    }
    storage_accounts = {
      level0 = {
        "Storage Blob Data Contributor" = {
          logged_in = {
            keys = ["user"]
          }
          azuread_groups = {
            keys = ["level0"]
          }
        }
      }
    }
  }
}
