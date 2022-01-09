landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "connectivity_virtual_wan"
  level               = "level2"
  key                 = "connectivity_non_prod_hubs"
  tfstates = {
    connectivity_non_prod_spokes_acn_iits1 = {
      level   = "current"
      tfstate = "connectivity_non_prod_spokes_acn_iits1.tfstate"
    }
    management = {
      level   = "lower"
      tfstate = "management.tfstate"
    }
  }
}

custom_variables = {
  virtual_hub_lz_key = "connectivity_virtual_hub_non_prod"
}
