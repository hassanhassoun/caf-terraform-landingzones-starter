# Updated list https://docs.microsoft.com/en-us/azure/aks/limit-egress-traffic#required-outbound-network-rules-and-fqdns-for-aks-clusters

azurerm_firewall_policy_rule_collection_groups = {
  root = {
    firewall_policy = {
      key = "root"
    }
    name     = "firewall-policy-root-egress"
    priority = 500

    application_rule_collections = {
      egress_443 = {
        name     = "egress 443"
        priority = 10000
        action   = "Allow"
        rules = {
          443 = {
            name              = "443"
            source_addresses  = ["*"]
            destination_fqdns = ["*"]
            protocols = {
              https = {
                port = "443"
                type = "Https"
              }
            }
          }
          monitoring = {
            name             = "azure-monitor"
            source_addresses = ["*"]
            destination_fqdns = [
              "dc.services.visualstudio.com",
              "*.ods.opinsights.azure.com",
              "*.oms.opinsights.azure.com",
              "*.monitoring.azure.com",
            ]
            protocols = {
              https = {
                port = "443"
                type = "Https"
              }
            }
          }
          policy = {
            name             = "azure-policy"
            source_addresses = ["*"]
            destination_fqdns = [
              "data.policy.core.windows.net",
              "store.policy.core.windows.net",
              "dc.services.visualstudio.com",
            ]
            protocols = {
              https = {
                port = "443"
                type = "Https"
              }
            }
          }
        }
      }
      security = {
        name     = "security packages"
        priority = 11000
        action   = "Allow"
        rules = {
          ubuntu = {
            name             = "ubuntu"
            source_addresses = ["*"]
            destination_fqdns = [
              "security.ubuntu.com",
              "azure.archive.ubuntu.com",
              "archive.ubuntu.com",
              "changelogs.ubuntu.com",
            ]
            protocols = {
              https = {
                port = "443"
                type = "Https"
              }
              http = {
                port = "80"
                type = "Http"
              }
            }
          }
        } // rules
      }   // packages
    }     // application_rule_collections

    network_rule_collections = {
      services = {
        name     = "services"
        action   = "Allow"
        priority = 1000
        rules = {
          ntp = {
            name             = "ntp"
            source_addresses = ["*"]
            destination_ports = [
              "123",
            ]
            destination_addresses = [
              "*"
            ]
            protocols = [
              "UDP",
            ]
          },
          DNS = {
            name             = "DNS"
            source_addresses = ["*"]
            destination_ports = [
              "53",
            ]
            destination_addresses = [
              "*"
            ]
            protocols = [
              "UDP",
            ]
          }
        }
      }
    } // network_rule_collection

  }

}