variable "cloud_images" {
  description = "Defines a list of all ubuntu releases which are downloaded as cloudimage"
  default = {
    "bionic" = {
      version = "18.04"
      name = "bionic"
      source = "http://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
    },
    "xenial" = {
      version = "16.04"
      name = "xenial"
      source = "http://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img"

    }
  }
}

variable "volume_pool" {
  description = "Where to download the images to"
  type = string
  default = "virtimages"
}

variable "distribution_name" {
  description = "Name of the distribution to use to deploy"
  type = string
}
