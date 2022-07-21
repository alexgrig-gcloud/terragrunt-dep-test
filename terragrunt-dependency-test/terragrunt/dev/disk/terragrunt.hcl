locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    project_id = local.environment_vars.locals.project
    env = local.environment_vars.locals.environment
    zone = local.environment_vars.locals.zone
}

terraform {
 source = "../../../terraform/modules/disk"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project  = local.project_id
  type     = "pd-ssd"
  name     = "${local.env}-disk"
  zone     = local.zone
}