terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 10.1.0"
    }
  }
  required_version = ">= 1.0"
}

output "rules" {
  value = data.akamai_property_rules_builder.rule_default.json
}

output "rule_format" {
  value = data.akamai_property_rules_builder.rule_default.rule_format
}