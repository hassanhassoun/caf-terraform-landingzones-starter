vnets = {
  vnet_vpn = {
    resource_group_key = "smb"
    vnet = {
      name          = "test-vpn"
      address_space = ["10.2.0.0/16"]
    }
    specialsubnets = {
      GatewaySubnet = {
        name = "GatewaySubnet" # must be named GatewaySubnet
        cidr = ["10.2.1.0/24"]
      }
    }
    subnets = {
      ep = {
        name                                           = "ep"
        cidr                                           = ["10.2.2.0/24"]
        service_endpoints                              = ["Microsoft.Storage"]
        enforce_private_link_endpoint_network_policies = true
      }
    }
  }
}

public_ip_addresses = {
  vngw_pip = {
    name               = "vngw_pip1"
    resource_group_key = "smb"
    sku                = "Basic"
    # Note: For UltraPerformance ExpressRoute Virtual Network gateway, the associated Public IP needs to be sku "Basic" not "Standard"
    allocation_method = "Dynamic"
    # allocation method needs to be Dynamic
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
}

virtual_network_gateways = {
  gateway1 = {
    name                       = "mygateway"
    resource_group_key         = "smb"
    type                       = "VPN"
    sku                        = "VpnGw1"
    private_ip_address_enabled = true
    # enable_bpg defaults to false. If set, true, input the necessary parameters as well. VPN Type only
    enable_bgp = false
    vpn_type   = "RouteBased"
    # multiple IP configs are needed for active_active state. VPN Type only.
    ip_configuration = {
      ipconfig1 = {
        ipconfig_name         = "gatewayIp1"
        public_ip_address_key = "vngw_pip"
        #lz_key                        = "examples"
        #lz_key optional, only needed if the vnet_key is inside another landing zone
        vnet_key                      = "vnet_vpn"
        private_ip_address_allocation = "Dynamic"
      }
    }
    vpn_client_configuration = {
      vpnconfig1 = {
        address_space = ["10.3.1.0/24"]
        revoked_certificate = {
          revoked_a = {
            name       = "Verizon-Global-Root-CA2"
            thumbprint = "912198EEF23DCAC40939312FEE97DD560BAE49B1"
          }
          revoked_b = {
            name       = "Verizon-Global-Root-CA"
            thumbprint = "912198EEF23DCAC40939312FEE97DD560BAE49B2"
          }
        }
        root_certificate = {
          name             = "MyCert"
          public_cert_data = "MIIC5jCCAc6gAwIBAgIICnCr4VbzH6IwDQYJKoZIhvcNAQELBQAwETEPMA0GA1UEAxMGVlBOIENBMB4XDTIxMTEyODE1NDkwOFoXDTI0MTEyNzE1NDkwOFowETEPMA0GA1UEAxMGVlBOIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxWCQ/b7wQZhbcKHJKToP5/eSyBRg4z3qOaXEtl0i0XcOVZlAkRq2fKl++lBjKwfR+gMu0eGRIRRBdcibYEVrf1K/yfpKuH8Vs7ze/mCO8y+WZp9+d1EgBV4CZrwwzBSFwNaCInWj/tR9hHFAQ+uuLFnpiOqblyOqjzNSAV3UBB67UISZBjVULopAGyZlCFALyr+8klEj2w0n7dz0GzAs0Lwweuz3D0kTQkpq/x9sGA7xDcoqFK/vdeVvtq8eXsOTXdqvimPIh/sNwLzrpsQXnRAnOpLUAG8Jkdu+uFPTn849Df0b5iuKMcdJGAual+8eWgPn32WW03bcfNk3JPqMHQIDAQABo0IwQDAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUFYQcyKjdCp5PeyGQJbZp2AEx8LYwDQYJKoZIhvcNAQELBQADggEBAHMDkCoXPWvrLO7q/rZZalLqNrvizZ3iJW3zMg14788Deu4Ep1wq/1vVyMtY69rRhE2YwEwUg9+CBGjAmf5McVAximU7+bF7q1Z3tbennAsIRmKmyIakI1jUQ3Rymw2Oc5I6huEgHSK//Ew0+PU7I88sXBbWNFA5wH9xkeLRPhRWwu2IV2M22bSHrVLtgqBh/OQwRdUOHvjsEpNqW1SuIclgApfzwwj8J8e98htsctyjr+VMTMXbmGVoJFSL4C1wrz1rsEB8Cs/iNlQNeFAbQfpMfSoj60KNXaPJYYq+ZYVcDKzxyow0lOUzmza8lpF/9ySmq5vwr9/UdQdOi1DCRkI="
        }
      }
    }
  }
}

private_endpoints = {
  vnet_vpn = { # Key of the virtual network
    # lz_key = ""  # Landingzone key when deployed in remote landing zone
    vnet_key    = "vnet_vpn"
    subnet_keys = ["ep"]
    # resource_group_key = "" # Key of resource group of the vnet

    storage_accounts = {
      smb = {
        # name = ""                        # Name of the private endpoint
        # lz_key = ""                      # Key of the landingzone where the storage account has been deployed.
        # resource_group_key = ""          # Key of the resource group where the private endpoint will be created. Default to the vnet's resource group
        # tags
        private_service_connection = {
          name              = "psc-stg-level0"
          subresource_names = ["blob", "file"]
          # request_message = ""
          # is_manual_connection = [true|false]
        }

      }
      # level1custom = {
      #   resource_id = "" # Using the created resource id if resource are created outside of CAF
      #
      #   private_service_connection = {
      #     name        = ""
      #   }
      #   private_dns = {
      #     zone_group_name = "default"
      #     # lz_key          = ""   # If the DNS keys are deployed in a remote landingzone
      #     keys = ["dns1"]
      #   }
      # }
    }
  }
}
