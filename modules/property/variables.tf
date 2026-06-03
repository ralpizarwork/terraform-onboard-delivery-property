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

variable "name" {
  type        = string
  description = "Akamai property hostname only. First part of FQDN"
}

variable "hostnames" {
  type        = list(string)
  description = "Akamai property entry point hostnames"
}

variable "rules" {
  type = string
  description = "Delivery property logic rules"
}

variable "rule_format" {
  type = string
  description = "Delivery property logic rules format"
}

variable "enrollment_id" {
  type        = string
  description = "The enrollment id of the certificate"
}

variable "contact_emails" {
  type        = list(string)
  description = "Email to be notified about property version push"
}

variable "version_notes" {
  type        = string
  default     = ""
  description = "Extra info about property and staging and production activation"
}

# For Akamai internal change management process
variable "compliance_record" {
  type = object({
    reason           = string
    peer_reviewed_by = optional(string)
    customer_email   = optional(string)
    unit_tested      = optional(bool)
  })
  validation {
    condition     = var.compliance_record == null ? true : contains(["none", "other", "no_production_traffic", "emergency"], var.compliance_record.reason)
    error_message = "Status must be one of none, no_production_traffic, emergency"
  }
  default = null
}
