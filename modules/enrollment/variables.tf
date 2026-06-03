variable "contract_id" {
  type        = string
  description = "The contract id that contains your certificate"
}

variable "common_name" {
  type        = string
  description = "The common name on the certificate"
}

variable "sans" {
  type        = list(string)
  description = "A list of san names"
}

variable "secure_network" {
  type        = string
  description = "The network to assign to. Can be either \"standard-tls\" or \"enhanced-tls\""
  validation {
    condition     = var.secure_network == "standard-tls" || var.secure_network == "enhanced-tls"
    error_message = "secure_network must be either 'standard-tls' or 'enhanced-tls'."
  }
}

variable "tech_contact" {
  description = "An object containing tech contact details for the certificate"
  type = object({
    first_name       = string
    last_name        = string
    organization     = string
    email            = string
    phone            = string
    address_line_one = string
    address_line_two = string
    city             = string
    region           = string
    postal_code      = string
    country_code     = string
  })
}

variable "admin_contact" {
  description = "An object containing admin contact details for the certificate"
  type = object({
    first_name       = string
    last_name        = string
    organization     = string
    email            = string
    phone            = string
    address_line_one = string
    address_line_two = string
    city             = string
    region           = string
    postal_code      = string
    country_code     = string
  })
}

variable "organization" {
  description = "An object containing organization details for the certificate"
  type = object({
    organization     = string
    unit             = string
    phone            = string
    address_line_one = string
    address_line_two = string
    city             = string
    region           = string
    postal_code      = string
    country_code     = string
  })
}

variable "network_configuration" {
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
