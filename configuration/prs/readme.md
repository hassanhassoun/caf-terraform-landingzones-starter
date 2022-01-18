
# Generate the terraform configuration files

To execute this step you need to login with one of the CAF maintainers accounts:
  - hassan.hassoun_avanade.com#EXT#@hassanhassounsandpit.onmicrosoft.com

```bash
rover login -t hassanhassounsandpit

rover ignite \
  --playbook /tf/caf/starter/templates/platform/ansible.yaml \
  -e base_templates_folder=/tf/caf/templates/platform \
  -e resource_template_folder=/tf/caf/templates/resources \
  -e config_folder=/tf/caf/orgs/prs/standalone/platform
  ```

Get started with the [launchpad](./platform/level0/launchpad)
