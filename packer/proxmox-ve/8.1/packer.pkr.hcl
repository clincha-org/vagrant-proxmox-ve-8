source "virtualbox-iso" "proxmox-ve-8-1" {
  guest_os_type = "Debian12_64"
  iso_url = "https://enterprise.proxmox.com/iso/proxmox-ve_8.1-2.iso"
  iso_checksum = "sha256:f3e3d2a6ad8e44020a499855475a304dbb672c284410a3792826098c906c63c0"
  ssh_username = "packer"
  ssh_password = "packer"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  boot_command = [
    "<down><enter>", # Terminal install
    "<wait30>", # Wait for DHCP and clock sync
    "<enter>", # Licence accept
    "<enter>", # Choose disk
    "<up><up><up><enter>", # Choose country
    "<end><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><enter>", # United Kingdom
    "<down><down><enter>", # Choose keyboard layout
    "<end><enter>", # Choose United Kingdom
    "<wait2>",
    "<down><enter>", # Complete
    "vagrant<down>", # root password
    "vagrant<down>", # root password
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", # delete 'mail@example.invalid'
    "vagrant<leftShiftOn>'<leftShiftOff>localhost.com<down>", # root email
    "<enter>", # Confirm root credentials
    "<enter>", # Confirm network settings
    "<right><enter>" # Begin installation
  ]
  memory = 4096
  cpus = 2
  ssh_timeout = "7h"

  nested_virt = true
  firmware = "efi"
  rtc_time_base = "UTC"

  vboxmanage = [
    [ "modifyvm", "{{.Name}}", "--firmware", "EFI" ],
  ]
}

build {
  sources = ["sources.virtualbox-iso.proxmox-ve-8-1"]
}