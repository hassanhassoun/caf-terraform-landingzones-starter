archetype_config_overrides = {
  root = {
    archetype_id = "es_root"
    parameters = {
      Deploy-Resource-Diag = {
        logAnalytics = {
          lz_key        = "management"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "central_logs_cc"
          attribute_key = "id"
        }
        "profileName" = {
          value = "eslz-diagnostic-log"
        }
      }
    }
    access_control = {
    }
  }
}
