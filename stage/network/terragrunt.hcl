terraform {
  source = "git::https://github.com/mustafaabdelbadea/terraform-modules-adcash.git//network"
}

prevent_destroy = true

include {
  path = find_in_parent_folders()
}
