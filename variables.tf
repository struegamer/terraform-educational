variable "number_of_masters" {
  type = number
  default = 1
}
variable "master_hostname" {
  type = string
}

variable "number_of_workers" {
  type = number
  default = 3
}
variable "worker_hostname" {
  type = string
}

variable "cloudinit_volpool" {
  type = string
  default = "virtimages"
}

variable "image_volpool" {
  type = string
  default = "virtimages"
}

variable "master_volpool" {
  description = "Where to download the images to"
  type = string
  default = "virtimages"
}

variable "ssh_pubkeys" {
  description = "List of ssh pubkey files to deploy"
  type = list(string)
  default = []
}

variable "pubkey_path" {
  description = "Location where to find the publickeys to deploy"
  type = string
}

variable "user_data_filename" {
  description = "User Data Filename, when set do not use the default one"
  type = string
  default = ""
}

variable "network_data_filename" {
  description = "Network Configuration Filename, when set do not use the default one"
  type = string
  default = ""
}

variable "distribution_name" {
  description = "Name of the distribution to use to deploy"
  type = string
}
