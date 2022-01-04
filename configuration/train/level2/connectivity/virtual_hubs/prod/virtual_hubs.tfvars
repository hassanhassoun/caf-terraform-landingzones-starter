virtual_hubs = {
  prod = {
    virtual_wan = {
      lz_key = "connectivity_virtual_wan"
      key    = "simple_global_wan"
    }

    resource_group = {
      lz_key = "connectivity_virtual_wan"
      key    = "simple_global_wan"
    }

    hub_name           = "prod"
    region             = "region1"
    hub_address_prefix = "10.10.10.0/23"
    deploy_firewall    = false
    deploy_p2s         = false
    p2s_config         = {}
    deploy_s2s         = false
    deploy_er          = false
  }
}

