resource "akamai_edge_hostname" "edgekey_host" {
  for_each = toset(var.hostnames)

  contract_id         = var.contract_id
  group_id            = var.group_id
  product_id          = var.product_id
  ip_behavior         = "IPV6_COMPLIANCE"
  edge_hostname       = "${each.value}.edgekey.net"
  certificate         = var.enrollment_id
  status_update_email = var.contact_emails
}
