
resource "libvirt_volume" "disk_ubuntu_resized" {
  count = var.number_of_instances
  name = var.number_of_instances > 1 ? format("${var.instance_hostname}.img", count.index + 1) : "${var.instance_hostname}.img"
  base_volume_id = var.base_image
  pool = var.volume_pool
  size = var.image_size
  format = var.image_type
}

resource "libvirt_domain" "domains" {
  count = var.number_of_instances

  name = var.number_of_instances > 1 ? format(var.instance_hostname, count.index) : var.instance_hostname

  memory = var.memory_size
  vcpu = var.no_of_vcpus

  cloudinit = var.cloudinits.*.id[count.index]
  autostart = true

  network_interface {
    network_name = "default"
    wait_for_lease = true
  }

  console {
    type = "pty"
    target_port = "0"
    target_type = "serial"
  }
  disk {
    volume_id = libvirt_volume.disk_ubuntu_resized.*.id[count.index]
  }
}
terraform {
  required_version = ">= 0.12"
}
