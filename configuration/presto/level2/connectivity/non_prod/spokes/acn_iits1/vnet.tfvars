resource_groups = {
  rg1 = {
    name = "prz-caf-connect-cc-002"
  }
}

vnets = {
  spoke001 = {
    resource_group_key = "rg1"
    vnet = {
      name          = "prz-spoke-connect-cc-001"
      address_space = ["10.3.0.0/23"]
    }
    specialsubnets = {
    }
    subnets = {}
  }
}

vnet_peerings = {
  hub_spoke_cc_001_TO_hub_cc_001 = {
    name = "prz-hub-spoke-cc-001-TO-hub-cc-001"
    from = {
      vnet_key = "spoke001"
      
    }
    to = {
      vnet_key = "hub"
      lz_key = "connectivity_non_prod_hubs"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = false
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}
