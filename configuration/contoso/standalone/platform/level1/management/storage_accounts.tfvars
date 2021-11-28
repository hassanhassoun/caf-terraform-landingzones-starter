storage_accounts = {
  smb = {
    name                     = "smb"
    resource_group_key       = "smb"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
    }
    file_shares = {
      homedir = {
        name  = "homedir"
        quota = "10"
      }
    }
  }
}
