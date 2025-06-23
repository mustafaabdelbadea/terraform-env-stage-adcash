terraform {
  source = "git::https://github.com/mustafaabdelbadea/terraform-modules-adcash.git//eks"
}

prevent_destroy = false

dependency "network" {
  config_path = "../network"

  mock_outputs = {
    vpc_id          = "vpc-abc123"
    private_subnets = ["subnet-abc123", "subnet-abc123"]
  }

  mock_outputs_allowed_terraform_commands = ["plan", "validate"]
}

inputs = {
  vpc_id          = dependency.network.outputs.vpc_id
  private_subnets = dependency.network.outputs.private_subnets
}

include {
  path = find_in_parent_folders()
}
