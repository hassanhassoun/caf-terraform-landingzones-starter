landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "connectivity_virtual_wan"
  level               = "level2"
  key                 = "connectivity_virtual_hub_prod"
  tfstates = {
    # Virtual WAN
    connectivity_virtual_wan = {
      level   = "current"
      tfstate = "connectivity_virtual_wan.tfstate"
    }
  }
}

custom_variables = {
  virtual_hub_lz_key = "connectivity_virtual_hub_prod"
}