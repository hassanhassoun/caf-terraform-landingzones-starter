# Launchpad - scenario sandpit-configuration / sandpit

The sandpit-configuration scenario is designed to demonstrate a basic functional foundations to store Terraform state on Azure storage and use it centrally.
The focus of this scenario is to be able to deploy a basic launchpad from a remote machine and use the portal to review the settings in a non-constrained environment.
For example in this scenario you can go to the Key Vaults and view the secrets from the portal, a feature that is disabled in the 300+ scenarios.

An estimated time of 5 minutes is required to deploy this scenario.

## Pre-requisites

This scenario requires the following privileges:

| Component          | Privileges         |
|--------------------|--------------------|
| Active Directory   | None               |
| Azure subscription | Subscription owner |

## Deployment


### Launchpad

```bash
rover login -t hassanhassounsandpit -s e59609a0-4cb2-4567-923e-ea8abc260726

cd /tf/caf/landingzones
git fetch origin
git checkout 2108.0

rover \
  -lz /tf/caf/landingzones/caf_launchpad \
  -var-folder /tf/caf//configuration/hhh/sandpit/standalone/platform/level0/launchpad \
  -tfstate_subscription_id e59609a0-4cb2-4567-923e-ea8abc260726 \
  -target_subscription e59609a0-4cb2-4567-923e-ea8abc260726 \
  -tfstate caf_launchpad.tfstate \
  -log-severity ERROR \
  -launchpad \
  -env sandpit \
  -level level0 \
  -p ${TF_DATA_DIR}/caf_launchpad.tfstate.tfplan \
  -a plan

```

## Architecture diagram
![Launchpad demo](../../../../../../documentation/img/launchpad-demo.PNG)


# Next steps

When you have successfully deployed the launchpad you can  move to the next step.


 [Deploy the management services](../../level1/management/readme.md)
