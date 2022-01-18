vnet_peerings = {
  hub_cc_001_TO_spoke_cc_001= {
    name = "prz-hub-cc-001-TO-spoke-cc-001"
    from = {
      vnet_key = "hub"
      lz_key = "connectivity_non_prod_hubs"
    }
    to = {
      vnet_key = "spoke001"
      lz_key = "connectivity_non_prod_spokes_acn_iits1"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = false
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}
