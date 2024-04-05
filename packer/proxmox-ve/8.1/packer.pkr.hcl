source "virtualbox-iso" "proxmox-ve-8-1" {
  guest_os_type    = "Debian12_64"
  iso_url          = "https://enterprise.proxmox.com/iso/proxmox-ve_8.1-2.iso"
  iso_checksum     = "sha256:f3e3d2a6ad8e44020a499855475a304dbb672c284410a3792826098c906c63c0"
  ssh_username     = "root"
  ssh_password     = "vagrant"
  shutdown_command = "echo 'packer' | shutdown now"
  boot_command     = [
    "<down><enter>", # Terminal install
    "<wait30>", # Wait for DHCP and clock sync
    "<enter>", # Licence accept
    "<wait2>",
    "<enter>", # Choose disk
    "<wait2>",
    "<up><up><up><enter>", # Choose country
    "<wait2>",
    "<end><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><enter>", # United Kingdom
    "<wait2>",
    "<down><down><enter>", # Choose keyboard layout
    "<wait2>",
    "<end><enter>", # Choose United Kingdom
    "<wait2>",
    "<down><enter>", # Complete
    "<wait2>",
    "vagrant<down>", # root password
    "vagrant<down>", # root password
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", # delete 'mail@example.invalid'
    "vagrant<leftShiftOn>'<leftShiftOff>localhost.com<down>", # root email 'vagrant@localhost.com'
    "<enter>", # Confirm root credentials
    "<wait2>",
    "<enter>", # Confirm network settings
    "<wait2>",
    "<right><enter>" # Begin installation
  ]
  memory      = 4096
  cpus        = 2
  ssh_timeout = "10m"

  nested_virt   = true
  firmware      = "efi"
  rtc_time_base = "UTC"
}

build {
  sources = ["sources.virtualbox-iso.proxmox-ve-8-1"]

  provisioner "shell" {
    script = "disable_enterprise_repositories.sh"
  }

  provisioner "shell" {
    script = "vagrant.sh"
  }
}