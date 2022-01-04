landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level0"
  key                 = "launchpad_credentials_rotation"
  tfstates = {
    launchpad = {
      level   = "current"
      tfstate = "caf_launchpad.tfstate"
    }
  }
}
