# Defines different repositories for the diagnostics logs
# Storage accounts, log analytics, event hubs

diagnostic_storage_accounts = {
  # Stores diagnostic logging for region1
  diaglogs_cc = {
    name                     = "diaglogscc"
    region                   = "region1"
    resource_group_key       = "mgmt"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    access_tier              = "Cool"
  }
  # Stores security logs for siem for region1
  diagsiem_cc = {
    name                     = "siemcc"
    region                   = "region1"
    resource_group_key       = "mgmt"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    access_tier              = "Cool"
  }
  # Stores boot diagnostic for region1
  bootdiag_cc = {
    name                     = "bootcc"
    region                   = "region1"
    resource_group_key       = "mgmt"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    access_tier              = "Cool"
  }
}