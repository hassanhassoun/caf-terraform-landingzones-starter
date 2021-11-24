# Launchpad - demo

## Pre-requisites

This scenario requires the following privileges:

| Component          | Privileges         |
|--------------------|--------------------|
| Active Directory   | None               |
| Azure subscription | Subscription owner |

## Deployment

### Pre-requisite

Elevate your credentials to the tenant root level to have enough privileges to create the management group hierarchy.

```bash
# Login to the subscription set_subscription_name with an account owner.
rover login -t hassanhassounsandpit
az rest --method post --url "/providers/Microsoft.Authorization/elevateAccess?api-version=2016-07-01"

```

### Launchpad

```bash
# Login to the subscription set_subscription_name with an account owner.
rover login -t hassanhassounsandpit -s set_subscription_guid

cd /tf/caf/landingzones
git fetch origin
git checkout patch.5.4.4

rover \
  -lz /tf/caf/landingzones/caf_launchpad \
  -var-folder /tf/caf/configuration/contoso/standalone/platform/level0/launchpad \
  -tfstate_subscription_id set_subscription_guid \
  -target_subscription set_subscription_guid \
  -tfstate caf_launchpad.tfstate \
  -log-severity ERROR \
  -launchpad \
  -env demo \
  -level level0 \
  -p ${TF_DATA_DIR}/caf_launchpad.tfstate.tfplan \
  -a plan

```

## Architecture diagram
![Launchpad demo](../../../../../../documentation/img/launchpad-demo.PNG)


# Next steps

When you have successfully deployed the launchpad you can  move to the next step.


 [Deploy the management services](../../level1/management/readme.md)
