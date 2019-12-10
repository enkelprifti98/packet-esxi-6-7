output "Message" {
  value = "Server is rebooting, the update will take a few more minutes to complete."
}

output "ESXi_Management_Addresses" {
  value = ["${packet_device.servers.*.access_public_ipv4}"]
}
