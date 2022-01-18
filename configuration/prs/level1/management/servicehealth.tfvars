monitoring = {
  service_health_alerts = {
    enable_service_health_alerts = true
    name                         = "alerts"
    action_group_name            = "actiongrp"
    shortname                    = "HealthAlerts"
    resource_group_key           = "management"

    email_alert_settings = {

      email_hassan = {
        name                    = "email_alert_to_hassan"
        email_address           = "hassan.hassoun@avanade.com"
        use_common_alert_schema = false
      }
    } #add more email alerts by repeating the block.
    # webhook = {
    #   teams = {
    #     name        = "servicehealth"
    #     service_uri = ""
    #   }
    # }
  }
}
