resource "libvirt_cloudinit_disk" "commoninit" {
  count = var.number_of_instances
  name = var.number_of_instances > 1 ? format("${var.image_hostname}-cloudinit.iso", count.index + 1) : "${var.image_hostname}-cloudinit.iso"
  user_data = var.user_data_filename == "" ? templatefile("${path.module}/default_data/cloud_init.cfg", {
    ssh_pubkeys : var.ssh_pubkeys,
    pubkey_path: var.pubkey_path
  }) : templatefile(var.user_data_filename, {
    ssh_pubkeys: var.ssh_pubkeys,
    pubkey_path: var.pubkey_path
  })
  network_config = var.network_data_filename == "" ? file("${path.module}/default_data/network_config.cfg") : file("${var.network_data_filename}")
  pool = var.volume_pool
}
