variable "cp_code_id" {
  type = number
  description = "CP Code to be configured"
}

variable "origin_server" {
  type = string
  description = "Origin server hostname"
}

variable "origin_leaf_certificate_pem" {
  type = string
  default = null
  description = "PEM encoded format leaf certificate to pin"
}

variable "origin_leaf_certificate_sha1fingerprint" {
  type = string
  default = null
  description = "SHA1 fingerprint from leaf certificate to pin"
}

variable "origin_ca_certificate_pem" {
  type = string
  default = null
  description = "PEM encoded format leaf certificate to pin"
}

variable "origin_ca_certificate_sha1fingerprint" {
  type = string
  default = null
  description = "SHA1 fingerprint from ca certificate to pin"
}
