config {
  format = "compact"

  force               = false
  call_module_type    = "local"
  disabled_by_default = false
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "aws" {
  enabled = true
  version = "0.40.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

# rule "aws_default_tags" {
#   enabled = true
#   tags    = ["Environment", "Project", "Owner"]
# }

rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_required_version" {
  enabled = false
}
