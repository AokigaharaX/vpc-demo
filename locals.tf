locals {
  first_az    = var.azs[0]
  environment = contains(keys(var.tags), "Environment") ? var.tags["Environment"] : "UNKNOWN"
}
