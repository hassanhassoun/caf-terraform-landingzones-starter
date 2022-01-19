diagnostic_storage_accounts = {
  # Stores security logs for siem default region"
  diagsiem_cc = {
    name                     = "przplfmopsccsiem"
    resource_group_key       = "management"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Cool"
  }
  # Stores diagnostic logging for region2
  diagsiem_ce = {
    name                     = "przplfmopscesiem"
    region                   = "region2"
    resource_group_key       = "management_region2"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Cool"
  }
}
