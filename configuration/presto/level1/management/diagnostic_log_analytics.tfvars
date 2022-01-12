#
# Define the settings for log analytics workspace and solution map
#

diagnostic_log_analytics = {
  central_logs_cc = {
    region             = "region1"
    name               = "prz-ops-cc-diag001"
    resource_group_key = "management"
    # you can setup up to 5 key

    diagnostic_profiles = {
      central_logs_region1 = {
        definition_key   = "log_analytics"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
    }
  }
}
