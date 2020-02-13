
variable "number_of_instances" {
  description = "The number of instances to deploy"
  type = number
  default = 1
}

variable "distribution_name" {
  description = "Name of the distribution to use to deploy"
  type = string
}

variable "instance_hostname" {
  description = "Hostname/Domainname of the k8 master vm, if multiple, make it a format string"
  type = string
}

variable "memory_size" {
  description = "Memory Size of VM in MB"
  type = number
  default = 2048
}

variable "no_of_vcpus" {
  description = "NUmber of virtual cpus of VM"
  type = number
  default = 2
}

variable "image_size" {
  description = "Resized image size, defaults to 20GB"
  type = number
  default = 21474836480
}

variable "image_type" {
  description = "Image Type on Disk, defaults to qcow2"
  type = string
  default = "qcow2"
}

variable "volume_pool" {
  description = "Where to download the images to"
  type = string
  default = "virtimages"
}

variable "cloudinits" {
  description = "Cloud Init Resource"
}

variable "base_image" {
  description = "Distribution Base Image To Resize"
}
