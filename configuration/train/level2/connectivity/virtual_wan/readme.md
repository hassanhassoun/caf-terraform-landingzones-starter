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
  -tfstate_subscription_id e59609a0-4cb2-4567-923e-ea8abc260726 \
  -target_subscription e59609a0-4cb2-4567-923e-ea8abc260726 \
  -tfstate connectivity_virtual_wan.tfstate \
  -env sandpit \
  -level level2 \
  -p ${TF_DATA_DIR}/connectivity_virtual_wan.tfstate.tfplan \
  -a plan

```
