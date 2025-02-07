
storage_accounts = {
  level0 = {
    name                     = "stgprodl0"
    resource_group_key       = "level0"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      ## Those tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates.
      # Only adjust the environment value at creation time
      tfstate         = "level0"
      environment     = "demo"
      launchpad       = "launchpad"
      caf_environment = "demo"
      caf_launchpad   = "launchpad"
      caf_tfstate     = "level0"
      ##
    }
    blob_properties = {
      versioning_enabled                = true
      container_delete_retention_policy = 7
      delete_retention_policy           = 7
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
  }

  level1 = {
    name                     = "stgprodl1"
    resource_group_key       = "level1"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      # Those tags must never be changed while set as they are used by the rover to locate the launchpad and the tfstates.
      tfstate         = "level1"
      environment     = "demo"
      launchpad       = "launchpad"
      caf_environment = "demo"
      caf_launchpad   = "launchpad"
      caf_tfstate     = "level1"
    }
    blob_properties = {
      versioning_enabled                = true
      container_delete_retention_policy = 7
      delete_retention_policy           = 7
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
  }

  level2 = {
    name                     = "stgprodl2"
    resource_group_key       = "level2"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      # Those tags must never be changed while set as they are used by the rover to locate the launchpad and the tfstates.
      tfstate         = "level2"
      environment     = "demo"
      launchpad       = "launchpad"
      caf_environment = "demo"
      caf_launchpad   = "launchpad"
      caf_tfstate     = "level2"
    }
    blob_properties = {
      versioning_enabled                = true
      container_delete_retention_policy = 7
      delete_retention_policy           = 7
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
  }


}