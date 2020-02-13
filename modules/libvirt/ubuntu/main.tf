
resource "libvirt_volume" "ubuntu_image" {
  name = format("ubuntu_%s.img", lookup(var.cloud_images, var.distribution_name, "").version)
  pool = var.volume_pool
  source = lookup(var.cloud_images, var.distribution_name, "").source
}

output "image_id" {
  value = libvirt_volume.ubuntu_image.id
}

terraform {
  required_version = ">= 0.12"
}
