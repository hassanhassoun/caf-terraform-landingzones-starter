# Defines the different destination for the different log profiles
# Different profiles to target different operational teams

diagnostics_destinations = {
  # Storage keys must reference the azure region name
  # For storage, reference "all_regions" and we will send the logs to the storage account
  # in the region of the deployment
  storage = {
    all_regions = {
      "Canada Central" = {
        storage_account_key = "diagsiem_cc"
      }
      "Canada East" = {
        storage_account_key = "diagsiem_cc"
      }
    }
  }

  log_analytics = {
    central_logs = {
      log_analytics_key              = "central_logs_cc"
      log_analytics_destination_type = "Dedicated"
    }
  }

  event_hub_namespaces = {
    central_logs = {
      event_hub_namespace_key = "central_logs_cc"
    }
  }
}
