resource_groups = {
  rg1 = {
    name = "ops-connectivity-cc-hub001"
  }
}

vnets = {
  hub = {
    resource_group_key = "rg1"
    vnet = {
      name          = "ops-cc-hub001"
      address_space = ["10.2.0.0/16"]
    }
    specialsubnets = {
      GatewaySubnet = {
        name = "GatewaySubnet" # must be named GatewaySubnet
        cidr = ["10.2.1.0/24"]
      }
    }
    subnets = {
      AzureBastionSubnet = {
        name    = "AzureBastionSubnet" #Must be called AzureBastionSubnet
        cidr    = ["10.2.2.64/26"]
        nsg_key = "azure_bastion_nsg"
      }
    }
  }
}
