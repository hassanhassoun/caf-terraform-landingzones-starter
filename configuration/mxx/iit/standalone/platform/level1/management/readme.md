
# Management
Deploy the management services

```bash
#Note: close previous session if you logged with a different service principal using --impersonate-sp-from-keyvault-url
rover logout

# login a with a user member of the caf-maintainers group
rover login -t hassanhassoun.com

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf//configuration/mxx/iit/standalone/platform/level1/management \
  -tfstate_subscription_id 89cbdaf0-0e38-4cc2-a186-554fa353aaeb \
  -target_subscription 89cbdaf0-0e38-4cc2-a186-554fa353aaeb \
  -tfstate management.tfstate \
  -log-severity ERROR \
  -env iit \
  -level level1 \
  -p ${TF_DATA_DIR}/management.tfstate.tfplan \
  -a plan

```


# Next steps

 [Deploy Enterprise Scale](../../level1/eslz/readme.md)
