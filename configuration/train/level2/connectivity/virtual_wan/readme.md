# Virtual Wan

```bash
# login a with a user member of the caf-platform-maintainers group
rover login -t hassanhassounsandpit

cd /tf/caf/landingzones
git fetch origin
git checkout patch.5.4.4

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -var-folder /tf/caf/configuration/train/level2/connectivity/virtual_wan \
  -tfstate_subscription_id set_subscription_guid \
  -target_subscription set_subscription_guid \
  -tfstate connectivity_virtual_wan.tfstate \
  -env demo \
  -level level2 \
  -p ${TF_DATA_DIR}/connectivity_virtual_wan.tfstate.tfplan \
  -a plan

```
