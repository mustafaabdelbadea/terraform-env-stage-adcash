terraform {
  source = "git::https://github.com/mustafaabdelbadea/terraform-modules-adcash.git//ec2"
}

prevent_destroy = true

dependency "network" {
  config_path = "../network"

  mock_outputs = {
    vpc_id          = "vpc-abc123"
    private_subnets = ["subnet-111", "subnet-222"]
    public_subnets  = ["subnet-111", "subnet-222"]
  }


  mock_outputs_allowed_terraform_commands = ["plan", "validate"]
}

inputs = {
  vpc_id          = dependency.network.outputs.vpc_id
  private_subnets = dependency.network.outputs.private_subnets
  public_subnets  = dependency.network.outputs.public_subnets
}

include {
  path = find_in_parent_folders()
}
