locals {
  property_hostnames_fqdn = [for host in var.property_hostnames : "${host}.${var.dns_zone}"]
}
