source "virtualbox-iso" "proxmox-ve-8" {
  guest_os_type = var.guest_os_type

  iso_url      = var.iso_url
  iso_checksum = var.iso_checksum

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_timeout  = var.ssh_timeout

  boot_command     = var.boot_command
  shutdown_command = var.shutdown_command

  cpus   = var.cpus
  memory = var.memory

  nested_virt   = var.nested_virt
  firmware      = var.firmware
  rtc_time_base = var.rtc_time_base
}

build {
  sources = ["sources.virtualbox-iso.proxmox-ve-8"]

  provisioner "shell" {
    script = "scripts/non-interactive-front-end.sh"
  }

  provisioner "shell" {
    script = "scripts/disable_enterprise_repositories.sh"
  }

  provisioner "shell" {
    script = "scripts/update.sh"
  }

  provisioner "shell" {
    script = "scripts/vagrant.sh"
  }

  post-processors {
    post-processor "vagrant" {
      vagrantfile_template = var.vagrantfile_template
      compression_level    = var.compression_level
      include              = var.include
    }

    post-processor "vagrant-cloud" {
      box_tag             = var.box_tag
      version             = var.version
      access_token        = var.access_token
      version_description = var.version_description
    }
  }
}