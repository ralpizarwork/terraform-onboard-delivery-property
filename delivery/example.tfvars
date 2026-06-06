# EdgeRC Information
edgerc_path    = "/Users/myuser/.edgerc"
edgerc_section = "default"

# Account Information
contract_id = "1-XXXXXX"
group_name  = "your_group_name"

# Akamai property setup
property_notes = "Terraform property version"
origin_server  = "origin.server.net"
property_name  = "delete.mydomain.com_pm"

#### DNS INFORMATION: FQDN [hostname].[zone/domain]
# Akamai digital property hostname ONLY part (not FQDN)
property_hostnames = [
  "www",
  "static"
]

# Akamai digital property only zone part
dns_zone = "mydomain.com"

contact_emails = [
  "emailr@gmail.com"
]

# This allows Akamai persone to push Akamai properties into internal accounts
compliance_reason = "no_production_traffic"

# Certifiate
cert_contact_details = {
  first_name       = "Alice"
  last_name        = "Smith"
  phone            = "+447700900123"
  email            = "alice@example.com"
  address_line_one = "1234 Test St."
  address_line_two = "Suite 567"
  city             = "Testville"
  country_code     = "GB"
  organization     = "Example Tdl"
  postal_code      = "TST123"
  region           = "Testshire"
  title            = "SA"
  unit             = "IT"
}
