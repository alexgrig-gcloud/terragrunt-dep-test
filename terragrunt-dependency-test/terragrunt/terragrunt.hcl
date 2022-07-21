locals{
    environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    env = local.environment_vars.locals.environment
    project = local.environment_vars.locals.project
}


generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "gcs" {
    bucket         = "${local.project}-${local.env}"
    prefix            = "/terragrunt-state"
  }
}
EOF
}