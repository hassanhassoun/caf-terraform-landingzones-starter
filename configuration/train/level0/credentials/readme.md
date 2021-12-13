
### Generate launchpad credentials

```bash
# For manual bootstrap:
# Login to the subscription Hassan Hassoun Sandpit with the user hassan.hassoun_avanade.com#EXT#@hassanhassounsandpit.onmicrosoft.com
rover login -t hassanhassounsandpit

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/train/level0/credentials \
  -tfstate_subscription_id e59609a0-4cb2-4567-923e-ea8abc260726 \
  -target_subscription e59609a0-4cb2-4567-923e-ea8abc260726 \
  -tfstate launchpad_credentials_rotation.tfstate \
  -launchpad \
  -log-severity ERROR \
  -env sandpit \
  -level level0 \
  -p ${TF_DATA_DIR}/launchpad_credentials_rotation.tfstate.tfplan \
  -a plan

rover logout

```


# Next steps

When you have successfully deployed the launchpad you can  move to the next step.

 [Deploy the billing subscription role delegation](../billing_subscription_role_delegations/readme.md)