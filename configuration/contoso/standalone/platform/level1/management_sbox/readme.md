
# Management
Deploy the management services

```bash
#Note: close previous session if you logged with a different service principal using --impersonate-sp-from-keyvault-url
rover logout

# login a with a user member of the caf-maintainers group
rover login -t hassanhassounsandpit

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/contoso/standalone/platform/level1/management \
  -tfstate_subscription_id set_subscription_guid \
  -target_subscription set_subscription_guid \
  -tfstate management.tfstate \
  -log-severity ERROR \
  -env demo \
  -level level1 \
  -p ${TF_DATA_DIR}/management.tfstate.tfplan \
  -a plan

```


# Next steps

When you have successfully deployed the management landing zone, you can move to the next step:

 [Deploy Connectivity](../../level2/connectivity/readme.md)
