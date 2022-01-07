vnets = {
  hub_re1 = {
    resource_group = {
      lz_key = "connectivity_virtual_wan"
      key    = "simple_global_wan"
    }
    region             = "region1"
    vnet = {
      name          = "hub-re1"
      address_space = ["100.64.100.0/22"]
    }
    specialsubnets = {
      GatewaySubnet = {
        name = "GatewaySubnet" #Must be called GateWaySubnet in order to host a Virtual Network Gateway
        cidr = ["100.64.100.0/27"]
      }
      AzureFirewallSubnet = {
        name = "AzureFirewallSubnet" #Must be called AzureFirewallSubnet
        cidr = ["100.64.101.0/26"]
      }
    }
    subnets = {
      AzureBastionSubnet = {
        name    = "AzureBastionSubnet" #Must be called AzureBastionSubnet
        cidr    = ["100.64.101.64/26"]
        
      }
      jumpbox = {
        name    = "jumpbox"
        cidr    = ["100.64.102.0/27"]
    
      }
      private_endpoints = {
        name                                           = "private_endpoints"
        cidr                                           = ["100.64.103.128/25"]
        enforce_private_link_endpoint_network_policies = true
      }
    }

  }
  hub_re2 = {
    resource_group = {
      lz_key = "connectivity_virtual_wan"
      key    = "simple_global_wan"
    }
    region             = "region1"
    vnet = {
      name          = "hub-re2"
      address_space = ["100.65.100.0/22"]
    }
    specialsubnets = {
      GatewaySubnet = {
        name = "GatewaySubnet" #Must be called GateWaySubnet in order to host a Virtual Network Gateway
        cidr = ["100.65.100.0/27"]
      }
      AzureFirewallSubnet = {
        name = "AzureFirewallSubnet" #Must be called AzureFirewallSubnet
        cidr = ["100.65.101.0/26"]
      }
    }
    subnets = {
      AzureBastionSubnet = {
        name    = "AzureBastionSubnet" #Must be called AzureBastionSubnet
        cidr    = ["100.65.101.64/26"]
        
      }
      jumpbox = {
        name    = "jumpbox"
        cidr    = ["100.65.102.0/27"]
    
      }
      private_endpoints = {
        name                                           = "private_endpoints"
        cidr                                           = ["100.65.103.128/25"]
        enforce_private_link_endpoint_network_policies = true
      }
    }

  }
}
