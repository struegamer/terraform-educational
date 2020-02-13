number_of_masters = 1
number_of_workers = 3
worker_hostname = "k8-node-%02d"
master_hostname = "k8-master"
ssh_pubkeys = [
  "id_rsa-libvirt.pub",
  "id_rsa_homedesktop.pub"
]
pubkey_path = "./pubkeys"
cloudinit_volpool = "virtimages"
image_volpool = "virtimages"
master_volpool = "virtimages"
user_data_filename = ""
network_data_filename = ""
distribution_name = "bionic"
