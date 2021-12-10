#
# Available roles:
# az rest --method Get --uri https://graph.microsoft.com/v1.0/directoryRoleTemplates -o json | jq -r .value[].displayName
#
azuread_roles = {
  azuread_apps = {
    app0 = {
      roles = [
        "Privileged Role Administrator",
        "Application Administrator",
        "Groups Administrator"
      ]
    }
    mgmt = {
      roles = [
        "Privileged Role Administrator",
        "Application Administrator",
        "Groups Administrator"
      ]
    }
  }
}
