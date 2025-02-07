# Updated list https://docs.microsoft.com/en-us/azure/aks/limit-egress-traffic#required-outbound-network-rules-and-fqdns-for-aks-clusters

azurerm_firewall_policy_rule_collection_groups = {
  aks_egress = {
    firewall_policy = {
      lz_key = "caf_networking_firewall"
      key    = "non_prod"
    }
    name     = "firewall-policy-aks-egress"
    priority = 600

    application_rule_collections = {
      aks = {
        name     = "aks_application"
        priority = 10000
        action   = "Allow"
        rules = {
          aks = {
            name             = "aks"
            source_addresses = ["*"]
            destination_fqdn_tags = [
              "AzureKubernetesService",
            ]
            destination_fqdns = [
              "*.azmk8s.io",
            ]
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
      packages = {
        name     = "packages"
        priority = 11000
        action   = "Allow"
        rules = {
          nvidia = {
            name             = "nvidia-gpu"
            source_addresses = ["*"]
            destination_fqdns = [
              "nvidia.github.io",
              "us.download.nvidia.com",
              "apt.dockerproject.org",
            ]
            protocols = {
              https = {
                port = "443"
                type = "Https"
              }
            }
          }
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
          },
          docker = {
            name             = "docker"
            source_addresses = ["*"]
            destination_fqdns = [
              "download.docker.com", # Docker
              "*.docker.io",         # Docker images
              "*.docker.com"         # Docker registry
            ]
            protocols = {
              http = {
                port = "443"
                type = "Https"
              }
            }
          },
          tools = {
            name             = "tools"
            source_addresses = ["*"]
            destination_fqdns = [
              "acs-mirror.azureedge.net",
              "packages.microsoft.com",
              "azurecliprod.blob.core.windows.net", # Azure cli
              "packages.cloud.google.com",          # kubectl
              "apt.kubernetes.io",                  # Ubuntu packages for kubectl
              "*.snapcraft.io",                     # snap to install kubectl
            ]
            protocols = {
              http = {
                port = "443"
                type = "Https"
              }
            }
          },
          github = {
            name             = "github"
            source_addresses = ["*"]
            destination_fqdns = [
              "api.github.com",
              "github.com",
              "github-production-release-asset-2e65be.s3.amazonaws.com",
            ]
            protocols = {
              http = {
                port = "443"
                type = "Https"
              }
            }
          },
          management = {
            name             = "management"
            source_addresses = ["*"]
            destination_fqdns = [
              "login.microsoftonline.com",
              "management.azure.com",
              "*.mcr.microsoft.com",
              "*.data.mcr.microsoft.com",
            ]
            protocols = {
              http = {
                port = "443"
                type = "Https"
              }
            }
          }
        } // rules
      }   // packages
    }     // application_rule_collections

    network_rule_collections = {
      aks = {
        name     = "aks_network"
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
          },
          monitor = {
            name             = "monitor"
            source_addresses = ["*"]
            destination_ports = [
              "443",
            ]
            destination_addresses = [
              "AzureMonitor"
            ]
            protocols = [
              "TCP",
            ]
          }
        }
      }
    } // network_rule_collection

  }

}