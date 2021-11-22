
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
            keys = ["eslz", "caf_platform_maintainers"]
          }
        }
        "Owner" = {
          azuread_groups = {
            keys = ["eslz", "caf_platform_maintainers"]
          }
        }
      }
    }
  subscriptions = {
    logged_in_subscription = {
      "Owner" = {
        azuread_groups = {
          keys = ["level0", "caf_platform_maintainers", "subscription_creation_platform"]
        }
      }
      "Reader" = {
        azuread_groups = {
          keys = ["identity"]
        }
      }
      }
    }

    resource_groups = {
      level0 = {
        "Reader" = {
          azuread_groups = {
            keys = [
              "identity",
              "subscription_creation_platform"
            ]
          }
        }
      }
      level1 = {
        "Reader" = {
          azuread_groups = {
            keys = [
              "identity",
              "management",
              "eslz",
              "subscription_creation_platform"
            ]
          }
        }
      }
      level2 = {
        "Reader" = {
          azuread_groups = {
            keys = [
              "identity",
              "connectivity",
              "management",
              "subscription_creation_landingzones"
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
          azuread_groups = {
            keys = ["level0", "caf_platform_maintainers", "identity"]
          }
        }
        "Storage Blob Data Reader" = {
          azuread_groups = {
            keys = [
              "management",
              "eslz",
              "subscription_creation_platform"
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
              "caf_platform_maintainers",
              "identity",
              "management",
              "eslz",
              "subscription_creation_platform"
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
              "identity",
              "connectivity",
              "management",
              "caf_platform_maintainers",
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
