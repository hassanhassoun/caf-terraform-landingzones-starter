resource_groups = {
  vnet_hub_re2 = {
    name   = "vnet-hub-re2"
    region = "region1"
  }
}
vnets = {
  hub_re2 = {
    resource_group_key = "vnet_hub_re2"
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
vnet_peerings = {
  hub_re2_TO_hub_re1 = {
    name = "hub_re2_TO_hub_re1"
    from = {
      vnet_key = "hub_re2"
    }
    to = {
      lz_key = "management"
      vnet_key = "hub_re1"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = false
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

}
