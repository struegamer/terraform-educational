variable "number_of_instances" {
  type = number
}
variable "image_hostname" {
  type = string
}

variable "volume_pool" {
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
