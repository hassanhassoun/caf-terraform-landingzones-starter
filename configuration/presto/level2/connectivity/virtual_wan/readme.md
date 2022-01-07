# Virtual Wan

```bash
# login a with a user member of the caf-platform-maintainers group
rover login -t hassanhassounsandpit

cd /tf/caf/landingzones
git fetch origin
git checkout patch.5.4.4

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/presto/level2/connectivity/virtual_wan \
  -tfstate_subscription_id <subscription_id> \
  -target_subscription <subscription_id> \
  -tfstate connectivity_virtual_wan.tfstate \
  -env sandpit \
  -level level2 \
  -p ${TF_DATA_DIR}/connectivity_virtual_wan.tfstate.tfplan \
  -a plan

```
