locals {
  secure_network = var.enhanced_tls == true ? "enhanced-tls" : "standard-tls"
}

module "enrollment" {
  source = "../modules/enrollment"

  contract_id           = var.contract_id
  common_name           = local.property_hostnames_fqdn[0]
  sans                  = local.property_hostnames_fqdn
  secure_network        = local.secure_network
  admin_contact         = var.cert_contact_details
  tech_contact          = merge(var.cert_contact_details, { email = "noreply@akamai.com" }) # Override the tech contact
  organization          = var.cert_contact_details
  network_configuration = var.cert_network_configuration
}

module "dns" {
  source = "../modules/dns"

  zone       = var.dns_zone
  challenges = module.enrollment.dns_challenges
  hostnames  = module.enrollment.hostnames
}

resource "time_sleep" "wait_dns_challenge" {
  # Wait for dns txt records to be ready for dv validation
  create_duration = "5m"
  depends_on      = [module.dns]
}

module "validation" {
  source = "../modules/validation"

  enrollment_id = module.enrollment.enrollment_id
  hostnames     = module.dns.hostnames
  depends_on    = [time_sleep.wait_dns_challenge]
}

output "certificate_dns_challenges" {
  value = module.enrollment.dns_challenges
}
