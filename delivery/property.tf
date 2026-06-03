locals {
  # Clean property name to be used as cp code name
  # The cpcode name contains one or more of these special characters ^ _ , # % ' \" ",
  cp_code_name = replace(var.property_name, "/[ ^_,#%'\"]/", "-")
}

resource "akamai_cp_code" "delivery_cp_code" {
  name        = local.cp_code_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
  timeouts {
    update = "1h"
  }
}

module "delivery_rules" {
  source = "../logic/delivery_rules"

  origin_server = var.origin_server
  cp_code_id    = akamai_cp_code.delivery_cp_code.id
}

module "property" {
  source = "../modules/property"

  contract_id       = var.contract_id
  group_id          = var.group_id
  product_id        = var.product_id
  name              = var.property_name
  hostnames         = local.property_hostnames_fqdn
  rules             = module.delivery_rules.rules
  rule_format       = module.delivery_rules.rule_format
  enrollment_id     = module.enrollment.enrollment_id
  contact_emails    = var.contact_emails
  version_notes     = var.property_notes
  compliance_record = {reason = "no_production_traffic"}
}

output "cp_code" {
  value = "${akamai_cp_code.delivery_cp_code.id} - ${akamai_cp_code.delivery_cp_code.name}"
}
