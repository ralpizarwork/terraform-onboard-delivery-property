
data "akamai_property_rules_builder" "rule_default" {
  rules_v2026_02_16 {
    name      = "default"
    is_secure = true
    comments  = "The Default Rule template contains all the necessary and recommended behaviors. Rules are evaluated from top to bottom and the last matching rule wins."
    behavior {
      origin {
        cache_key_hostname = "REQUEST_HOST_HEADER"
        compress           = true
        custom_certificate_authorities {
          sha1_fingerprint = var.origin_ca_certificate_sha1fingerprint
          pem_encoded_cert = var.origin_ca_certificate_pem
        }
        custom_certificates {
          sha1_fingerprint = var.origin_leaf_certificate_sha1fingerprint
          pem_encoded_cert = var.origin_leaf_certificate_pem
        }
        custom_valid_cn_values           = ["{{Origin Hostname}}", "{{Forward Host Header}}", ]
        enable_true_client_ip            = true
        forward_host_header              = "REQUEST_HOST_HEADER"
        hostname                         = var.origin_server
        http2_enabled                    = false
        http2_title                      = ""
        http_port                        = 80
        https_port                       = 443
        ip_version                       = "IPV4"
        min_tls_version                  = "DYNAMIC"
        origin_certificate               = ""
        origin_certs_to_honor            = "COMBO"
        origin_sni                       = true
        origin_type                      = "CUSTOMER"
        ports                            = ""
        standard_certificate_authorities = ["akamai-permissive", "THIRD_PARTY_AMAZON", ]
        tls_version_title                = ""
        true_client_ip_client_setting    = false
        true_client_ip_header            = "True-Client-IP"
        verification_mode                = "CUSTOM"
      }
    }
    behavior {
      cp_code {
        enable_default_content_provider_code = false
        value {
          id = var.cp_code_id
        }
      }
    }
    children = [
      data.akamai_property_rules_builder.rule_origin_ipacl.json,
      data.akamai_property_rules_builder.rule_accelerate_delivery.json,
      data.akamai_property_rules_builder.rule_offload_origin.json,
      data.akamai_property_rules_builder.rule_strengthen_security.json,
      data.akamai_property_rules_builder.rule_minimize_payload.json,
    ]
  }
}
