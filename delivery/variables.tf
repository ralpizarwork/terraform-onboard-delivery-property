variable "edgerc_path" {
  type        = string
  description = "Autentication file path on disk"
}

variable "edgerc_section" {
  type        = string
  description = "Section inside edgerc file"
}

variable "contract_id" {
  type        = string
  description = "Akamai contract ID"
}

variable "group_id" {
  type        = string
  description = "Akamai group ID"
}

variable "product_id" {
  type    = string
  default = "Fresca"
}

variable "origin_server" {
  type        = string
  description = "Origin server hostname"
}

variable "property_name" {
  type        = string
  description = "Akamai property hostname only. First part of FQDN"
}

variable "dns_zone" {
  type        = string
  description = "DNS zone for the hostname"
}

variable "property_hostnames" {
  type        = list(string)
  description = "Akamai property entry point hostnames"
}

variable "contact_emails" {
  type        = list(string)
  description = "Email to be notified about property version push"
}

variable "property_notes" {
  type        = string
  description = "Property version notes"
}

variable "compliance_reason" {
  type        = string
  description = "Required when Akamai employee push test properties to production under internal account without PR"
}

# Certificates
variable "cert_contact_details" {
  type = object({
    first_name       = string
    last_name        = string
    phone            = string
    email            = string
    address_line_one = string
    address_line_two = string
    city             = string
    country_code     = string
    organization     = string
    postal_code      = string
    region           = string
    title            = string
    unit             = string
  })
  description = "This is the person the CA contacts to verify the certificate request"
}

variable "cert_network_configuration" {
  type = object({
    disallowed_tls_versions = list(string)
    clone_dns_names         = bool
    geography               = string
    ocsp_stapling           = string
    preferred_ciphers       = string
    must_have_ciphers       = string
    quic_enabled            = bool
  })
  default = {
    disallowed_tls_versions = ["TLSv1", "TLSv1_1"]
    clone_dns_names         = true
    geography               = "core"
    ocsp_stapling           = "on"
    preferred_ciphers       = "ak-akamai-2020q1"
    must_have_ciphers       = "ak-akamai-2020q1"
    quic_enabled            = false
  }
  description = "Specify how your certificate deploys to the Akamai Secure CDN"
}
