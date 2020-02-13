provider "libvirt" {
  alias = "desktop"
  uri = "qemu+ssh://username@libvirt-host.domain.tld/system?socket=/var/run/libvirt/libvirt-sock"
}

module "images" {
  source = "./modules/libvirt/ubuntu"
  providers = {
    libvirt = libvirt.desktop
  }

  distribution_name = var.distribution_name
  volume_pool = var.image_volpool
}

module "cloudinits_master" {
  source = "./modules/libvirt/cloud_init"
  providers = {
    libvirt = libvirt.desktop
  }
  number_of_instances = var.number_of_masters
  image_hostname = var.master_hostname
  volume_pool = var.cloudinit_volpool
  ssh_pubkeys = var.ssh_pubkeys
  pubkey_path = var.pubkey_path
  user_data_filename = var.user_data_filename
  network_data_filename = var.network_data_filename
}

module "cloudinits_workers" {
  source = "./modules/libvirt/cloud_init"
  providers = {
    libvirt = libvirt.desktop
  }
  number_of_instances = var.number_of_workers
  image_hostname = var.worker_hostname
  volume_pool = var.cloudinit_volpool
  ssh_pubkeys = var.ssh_pubkeys
  pubkey_path = var.pubkey_path
  user_data_filename = var.user_data_filename
  network_data_filename = var.network_data_filename
}


module "k8master" {
  source = "./modules/libvirt/domains"
  providers = {
    libvirt = libvirt.desktop
  }
  distribution_name = var.distribution_name
  number_of_instances = var.number_of_masters
  instance_hostname  = var.master_hostname
  cloudinits = module.cloudinits_master.cloudinit
  base_image = module.images.image_id
}

module "k8workers" {
  source = "./modules/libvirt/domains"
  providers = {
    libvirt = libvirt.desktop
  }
  distribution_name = var.distribution_name
  number_of_instances = var.number_of_workers
  instance_hostname  = var.worker_hostname
  cloudinits = module.cloudinits_workers.cloudinit
  base_image = module.images.image_id
}


output "k8_master_ips" {
  value = module.k8master.foo
}

output "k8_worker_ips" {
  value = module.k8workers.foo
}

