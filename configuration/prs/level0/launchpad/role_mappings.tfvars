
#
# Services supported: subscriptions, storage accounts and resource groups
# Can assign roles to: AD groups, AD object ID, AD applications, Managed identities
#

role_mapping = {
  built_in_role_mapping = {
    subscriptions = {
      "Hassan Hassoun Sandpit" = {
        lz_key = "seed"
        "Owner" = {
          azuread_groups = {
            keys = ["management"]
          }
        }
      }
      logged_in_subscription = {
        "Reader" = {
          azuread_groups = {
            keys = ["connectivity", "management"]
          }
        }
      }
    }

    resource_groups = {
      level1 = {
        "Reader" = {
          azuread_groups = {
            keys = [
              "management"
            ]
          }
        }
      }
      level2 = {
        "Reader" = {
          azuread_groups = {
            keys = [
              "connectivity",
              "management"
            ]
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
        }
        "Storage Blob Data Reader" = {
          azuread_groups = {
            keys = [
              "management",
              "connectivity"
            ]
          }
        }
      }

      level1 = {
        "Storage Blob Data Contributor" = {
          logged_in = {
            keys = ["user"]
          }
          azuread_groups = {
            keys = [
              "management"
            ]
          }
        }
        "Storage Blob Data Reader" = {
          azuread_groups = {
            keys = [
              "connectivity",
            ]
          }
        }
      }

      level2 = {
        "Storage Blob Data Contributor" = {
          logged_in = {
            keys = ["user"]
          }
          azuread_groups = {
            keys = [
              "connectivity",
            ]
          }
        }
        "Storage Blob Data Reader" = {
          azuread_groups = {
            keys = [
            ]
          }
        }
      }
    }
  }
}
