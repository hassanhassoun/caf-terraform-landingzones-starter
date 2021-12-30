landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level1"
  key                 = "eslz"
  tfstates = {
    launchpad = {
      level   = "lower"
      tfstate = "caf_launchpad.tfstate"
    }
    management = {
      level   = "current"
      tfstate = "management.tfstate"
    }
    platform_subscriptions = {
      level   = "current"
      tfstate = "platform_subscriptions.tfstate"
    }
    identity = {
      level   = "current"
      tfstate = "identity.tfstate"
    }
  }
}
