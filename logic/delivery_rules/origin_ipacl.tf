
data "akamai_property_rules_builder" "rule_origin_ipacl" {
  rules_v2026_02_16 {
    name                  = "Origin IPACL"
    criteria_must_satisfy = "all"
    behavior {
      origin_ip_acl {
        enable = true
      }
    }
  }
}
