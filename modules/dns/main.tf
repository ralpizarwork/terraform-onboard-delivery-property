locals {
  challenge_found = length(var.challenges) > 0
}

resource "akamai_dns_record" "validations" {
  for_each = var.challenges

  zone       = var.zone
  name       = local.challenge_found ? var.challenges[each.key].full_path : "record-safe-to-delete.${var.zone}"
  recordtype = "TXT"
  target     = local.challenge_found ? [var.challenges[each.key].response_body] : ["_acme-challenge-not-available"]
  ttl        = 60
}

# The hostnames that were passed to us when we created these properties
output "hostnames" {
  value = var.hostnames
}
