# Enterprise scale

## Deploy Enterprise Scale

Note you need to adjust the branch to deploy Enterprise Scale to eslz.0.3.3

```bash
az account clear
# login a with a user member of the caf-platform-maintainers group
rover login -t hassanhassounsandpit

cd /tf/caf//landingzones
git fetch origin
git checkout eslz.0.3.3

rover \
  -lz /tf/caf//landingzones/caf_solution/add-ons/caf_eslz \
  -var-folder /tf/caf//configuration/hhh/sandpit/standalone/platform/level1/eslz \
  -tfstate_subscription_id e59609a0-4cb2-4567-923e-ea8abc260726 \
  -tfstate eslz.tfstate \
  -log-severity ERROR \
  -env sandpit \
  -level level1 \
  -p ${TF_DATA_DIR}/eslz.tfstate.tfplan \
  -a plan

```

# Next steps

 [Deploy Connectivity](../../level2/connectivity/readme.md)
