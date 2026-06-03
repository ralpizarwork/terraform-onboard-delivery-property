resource "akamai_property" "delivery_property" {
  name        = var.name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id

  dynamic "hostnames" {
    for_each = toset(var.hostnames)
    content {
      cname_from             = hostnames.value
      cname_to               = akamai_edge_hostname.edgekey_host[hostnames.value].edge_hostname
      cert_provisioning_type = "CPS_MANAGED"
    }
  }
  rule_format = var.rule_format
  rules       = var.rules

  version_notes = var.version_notes
}

# Staging Activation
resource "akamai_property_activation" "delivery_property_staging" {
  property_id                    = akamai_property.delivery_property.id
  contact                        = var.contact_emails
  version                        = akamai_property.delivery_property.latest_version
  network                        = "STAGING"
  note                           = var.version_notes
  auto_acknowledge_rule_warnings = true
}

# Production Activation
resource "akamai_property_activation" "delivery_property_production" {
  property_id                    = akamai_property.delivery_property.id
  contact                        = var.contact_emails
  version                        = akamai_property.delivery_property.latest_version
  network                        = "PRODUCTION"
  note                           = var.version_notes
  auto_acknowledge_rule_warnings = true
  dynamic "compliance_record" {
    for_each = var.compliance_record != null ? [1] : []
    content {
      dynamic "noncompliance_reason_none" {
        for_each = var.compliance_record.reason == "none" ? [1] : []
        content {
          customer_email   = var.compliance_record.customer_email
          peer_reviewed_by = var.compliance_record.peer_reviewed_by
          unit_tested      = var.compliance_record.unit_tested
        }
      }

      dynamic "noncompliance_reason_no_production_traffic" {
        for_each = var.compliance_record.reason == "no_production_traffic" ? [1] : []
        content {
        }
      }
    }
  }
}

output "delivery_property" {
  value = {
    name           = akamai_property.delivery_property.name
    version_notes  = akamai_property.delivery_property.version_notes
    latest_version = akamai_property.delivery_property.latest_version
  }
}

output "delivery_staging_active_version" {
  value = akamai_property_activation.delivery_property_staging.version
}
