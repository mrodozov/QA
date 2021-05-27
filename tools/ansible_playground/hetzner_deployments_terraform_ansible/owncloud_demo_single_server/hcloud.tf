terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.25.2"
    }
  }
}

variable "hcloud_token" {}
variable "owner_tag" {}
variable "labels" {}
variable "key_names" {}
variable "machine_name" {}
variable "image" {}
variable "server_type" {}

provider "hcloud" {
  token = var.hcloud_token
}

data "hcloud_ssh_key" "sshkeys" {
  count = length(var.key_names)
  name = var.key_names[count.index]
}

resource "hcloud_server" "owncloud_server" {
  name        = "${var.owner_tag}-${var.machine_name}"
  image       = var.image
  server_type = var.server_type
  ssh_keys    = data.hcloud_ssh_key.sshkeys[*].id
  labels      = var.labels

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host = self.ipv4_address
      type = "ssh"
      user = "root"
    }
  }
  provisioner "local-exec" {
    command = "echo ${self.ipv4_address} > hosts"
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --extra-vars 'target=${self.ipv4_address}' install_owncloud.yml"
  }
}



output "owncloud_server_ip" {
  value = hcloud_server.owncloud_server.ipv4_address
  depends_on = [
    hcloud_server.owncloud_server
  ]
}

output "sshkeyoutput" {
  value = data.hcloud_ssh_key.sshkeys[*].name
}

