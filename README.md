<!-- BEGIN_TF_DOCS -->



# Example
An example is shown below. Please refer to the example directory in this git repo for further details
```hcl
locals {
  secure_network = var.enhanced_tls == true ? "enhanced-tls" : "standard-tls"
}

module "enrollment" {
  source                = "../modules/enrollment"
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
  source     = "../modules/dns"
  zone       = var.dns_zone
  challenges = module.enrollment.dns_challenges
  hostnames  = module.enrollment.hostnames
}

module "validation" {
  source        = "../modules/validation"
  enrollment_id = module.enrollment.enrollment_id
  hostnames     = module.dns.hostnames
}

output "certificate_dns_challenges" {
  value = module.enrollment.dns_challenges
}
```

## Requirements

No requirements.

## Resources

No resources.

## Modules

No modules.

## Inputs

No inputs.

## Outputs

No outputs.

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->