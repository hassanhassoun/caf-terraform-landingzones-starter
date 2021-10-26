
# Connectivity
You have selected the vwan networking option to build your Enteprise Scale platform. The following instructions guides you through the steps to follow.

## Select the correct branch for the landingzones code

Note you need to adjust the branch 2108.0 to deploy the connectivity services

## Virtual Wan

```bash
# login a with a user member of the caf-platform-maintainers group
rover login -t hassanhassounsandpit

cd /tf/caf//landingzones
git fetch origin
git checkout 2108.0

rover \
  -lz /tf/caf//landingzones/caf_solution \
  -var-folder /tf/caf//configuration/hhh/sandpit/standalone/platform/level2/connectivity/virtual_wan \
  -tfstate_subscription_id e59609a0-4cb2-4567-923e-ea8abc260726 \
  -target_subscription e59609a0-4cb2-4567-923e-ea8abc260726 \
  -tfstate connectivity_virtual_wan.tfstate \
  -env sandpit \
  -level level2 \
  -p ${TF_DATA_DIR}/connectivity_virtual_wan.tfstate.tfplan \
  -a plan

```

## Virtual hubs

### prod

```bash
# login a with a user member of the caf-platform-maintainers group
rover login -t hassanhassounsandpit

cd /tf/caf//landingzones
git fetch origin
git checkout 2108.0

rover \
  -lz /tf/caf//landingzones/caf_solution \
  -var-folder /tf/caf//configuration/hhh/sandpit/standalone/platform/level2/connectivity/virtual_hubs/prod \
  -tfstate_subscription_id e59609a0-4cb2-4567-923e-ea8abc260726 \
  -target_subscription e59609a0-4cb2-4567-923e-ea8abc260726 \
  -tfstate connectivity_virtual_hub_prod.tfstate \
  -log-severity ERROR \
  -env sandpit \
  -level level2 \
  -p ${TF_DATA_DIR}/connectivity_virtual_hub_prod.tfstate.tfplan \
  -a plan


```
### non_prod

```bash
# login a with a user member of the caf-platform-maintainers group
rover login -t hassanhassounsandpit

cd /tf/caf//landingzones
git fetch origin
git checkout 2108.0

rover \
  -lz /tf/caf//landingzones/caf_solution \
  -var-folder /tf/caf//configuration/hhh/sandpit/standalone/platform/level2/connectivity/virtual_hubs/non_prod \
  -tfstate_subscription_id e59609a0-4cb2-4567-923e-ea8abc260726 \
  -target_subscription e59609a0-4cb2-4567-923e-ea8abc260726 \
  -tfstate connectivity_virtual_hub_non_prod.tfstate \
  -log-severity ERROR \
  -env sandpit \
  -level level2 \
  -p ${TF_DATA_DIR}/connectivity_virtual_hub_non_prod.tfstate.tfplan \
  -a plan


```


