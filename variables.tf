variable "auth_token" {
  description = "Your Packet API token"
  default = "TOKEN"
}

variable "project_id" {
  description = "Your Packet project ID"
  default = "PROJECT_ID"
}

variable "private_key_filename" {
  description = "SSH private key associated with public key. This must be a key without a passphrase."
  default = "~/.ssh/id_rsa"
}

variable "facility" {
  description = "The facility in which the bare metal server will be provisioned."
  default = "ewr1"
}

variable "plan" {
  description = "The server type that you want to provision"
  default = "t1.small.x86"
}

variable "amount" {
  description = "Amount of servers to be deployed"
  default = 2
}

variable "esxi_update_filename" {
  description = "The specific update version that your servers will be updated to. Note that the Packet portal and API will still show ESXi 6.5 as the OS but this script adds a tag with the update filename specified below. You can check all ESXi update versions/filenames here: https://esxi-patches.v-front.de/ESXi-6.7.0.html"
  default = "ESXi-6.7.0-20191104001-standard"
}

variable "public_ipv4_subnet_size" {
  description = "Public IPv4 management subnet size, size should be set as the total amount of IPs in the subnet. Ex: For /28 subnet, amount = 16. /29 is default for ESXi on Packet."
  default = 8
}

