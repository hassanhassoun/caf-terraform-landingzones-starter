archetype_config_overrides = {
  root = {
    archetype_id = "es_root"
    parameters = {
      "Deny-RSG-Locations" = {
        "listOfAllowedLocations" = {
          values = ["canadacentral", "canadaeast"]
        }
      }
      "Deploy-AzActivity-Log" = {
        "logAnalytics" = {
          lz_key        = "management"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "central_logs_cc"
          attribute_key = "id"
        }
      }
      "Deploy-Resource-Diag" = {
        "profileName" = {
          value = "eslz-diagnostic-log"
        }
        "logAnalytics" = {
          lz_key        = "management"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "central_logs_cc"
          attribute_key = "id"
        }
      }
      "Deploy-VM-Monitoring" = {
        "logAnalytics_1" = {
          lz_key        = "management"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "central_logs_cc"
          attribute_key = "id"
        }
      }
      "Deploy-VMSS-Monitoring" = {
        "logAnalytics_1" = {
          lz_key        = "management"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "central_logs_cc"
          attribute_key = "id"
        }
      }
    }
    access_control = {}
  }

  landing-zones = {
    archetype_id = "es_landing_zones"
    parameters = {
      "CIS-v1.3.0" = {
        "JavaLatestVersion" = {
          value = "10"
        }
      }
      "Enforce-TLS-SSL" = {
        "AKSIngressHttpsOnlyEffect" = {
          value = "audit"
        }
      }
    }
    access_control = {}
  }

}