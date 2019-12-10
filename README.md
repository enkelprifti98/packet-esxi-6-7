# Deploy VMWare ESXi 6.7 on Packet Bare Metal Servers
This Terraform script lets you deploy ESXi 6.7 on Packet servers. As of now, only ESXi 6.5 is officially supported on Packet. This script deploys ESXi 6.5 and then runs a shell script that updates the server to ESXi 6.7. To run the script, git clone this repo, install Terraform and run the following in the script directory:

```
terraform init
terraform apply
```

If you would like to perform the update manually, you need to deploy an ESXi 6.5 server and run the following commands through SSH in the server once it has been deployed:

```sh
# Determine the latest ESXi update here:
# https://esxi-patches.v-front.de/ESXi-6.7.0.html

# SSH and Shell are enabled by default on Packet ESXi servers

# Swap must be enabled on the datastore. Otherwise, the upgrade may fail with a "no space left" error.
esxcli sched swap system set --datastore-enabled true
esxcli sched swap system set --datastore-name datastore1

# Update to your specified version of ESXi
vim-cmd /hostsvc/maintenance_mode_enter

esxcli network firewall ruleset set -e true -r httpClient

# The variable esxi_update_filename can be retrieved from the website above
esxcli software profile update -d https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml -p ${esxi_update_filename}

esxcli network firewall ruleset set -e false -r httpClient

vim-cmd /hostsvc/maintenance_mode_exit

reboot
```
