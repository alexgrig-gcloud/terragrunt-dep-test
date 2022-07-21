locals {
    project = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.project
    zone = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.zone
    env = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.environment
}

dependency "disk_id" {
    config_path = "../disk"
}

terraform {
   source = "../../../terraform/modules/vm"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project       = local.project
  vm_name       = "${local.env}-vm"
  zone          = local.zone
  disk_attached = "dependency.disk_id.outputs.disk_id"
  machine_type  = "e2-medium"
}