<!-- BEGIN_TF_DOCS -->



# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 contact_emails  = <list(string)>
  	 contract_id  = <string>
  	 enrollment_id  = <string>
  	 group_id  = <string>
  	 hostnames  = <list(string)>
  	 name  = <string>
  	 rule_format  = <string>
  	 rules  = <string>
  
	 # Optional variables
  	 compliance_record  = <object({
    reason           = string
    peer_reviewed_by = optional(string)
    customer_email   = optional(string)
    unit_tested      = optional(bool)
  })> | default: null
  	 product_id  = <string> | default: "Fresca"
  	 version_notes  = <string> | default: ""
}
 ```

## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | ~> 10.0 |

## Resources

| Name | Type |
| ---- | ---- |
| [akamai_edge_hostname.edgekey_host](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/edge_hostname) | resource |
| [akamai_property.delivery_property](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property) | resource |
| [akamai_property_activation.delivery_property_production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |
| [akamai_property_activation.delivery_property_staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/property_activation) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_contact_emails"></a> [contact\_emails](#input\_contact\_emails) | Email to be notified about property version push | `list(string)` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Akamai contract ID | `string` | n/a | yes |
| <a name="input_enrollment_id"></a> [enrollment\_id](#input\_enrollment\_id) | The enrollment id of the certificate | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Akamai group ID | `string` | n/a | yes |
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | Akamai property entry point hostnames | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Akamai property hostname only. First part of FQDN | `string` | n/a | yes |
| <a name="input_rule_format"></a> [rule\_format](#input\_rule\_format) | Delivery property logic rules format | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | Delivery property logic rules | `string` | n/a | yes |
| <a name="input_compliance_record"></a> [compliance\_record](#input\_compliance\_record) | For Akamai internal change management process | <pre>object({<br/>    reason           = string<br/>    peer_reviewed_by = optional(string)<br/>    customer_email   = optional(string)<br/>    unit_tested      = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_product_id"></a> [product\_id](#input\_product\_id) | n/a | `string` | `"Fresca"` | no |
| <a name="input_version_notes"></a> [version\_notes](#input\_version\_notes) | Extra info about property and staging and production activation | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_delivery_property"></a> [delivery\_property](#output\_delivery\_property) | n/a |
| <a name="output_delivery_staging_active_version"></a> [delivery\_staging\_active\_version](#output\_delivery\_staging\_active\_version) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->