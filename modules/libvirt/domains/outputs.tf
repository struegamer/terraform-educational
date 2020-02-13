output "domain_ips" {
  value = {
    domain: "${libvirt_domain.domains.*.name}",
    ip = "${libvirt_domain.domains.*.network_interface.0.addresses.0}",
    id = "${libvirt_domain.domains.*.id}"
  }
}

output "foo" {
  value = [for k, v in tolist(libvirt_domain.domains.*) : { "${v.name}" = v.network_interface.0.addresses.0}]
}


output "doms" {
  value = libvirt_domain.domains
}
