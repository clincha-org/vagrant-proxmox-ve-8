# Guest
variable "guest_os_type" {
  type    = string
  default = "Debian12_64"
}

# ISO
variable "iso_url" {
  type    = string
  default = "https://enterprise.proxmox.com/iso/proxmox-ve_8.2-2.iso"
}
variable "iso_checksum" {
  type    = string
  default = "sha256:c96ad84eacbbcef299ab8f407f9602f832abb5ceb08a9aa288c1e1164df2da97"
}

# SSH
variable "ssh_username" {
  type    = string
  default = "root"
}
variable "ssh_password" {
  type    = string
  default = "vagrant"
}
variable "ssh_timeout" {
  type    = string
  default = "10m"
}

# Commands (see variables-boot-command.pkr.hcl for boot_command)
variable "shutdown_command" {
  type    = string
  default = "echo 'proxmox-ve-8' | shutdown now"
}

# Hardware settings
variable "cpus" {
  type    = number
  default = 1
}
variable "memory" {
  type    = number
  default = 2048
}

# System settings
variable "nested_virt" {
  type    = bool
  default = true
}
variable "firmware" {
  type    = string
  default = "efi"
}
variable "rtc_time_base" {
  type    = string
  default = "UTC"
}
variable "headless" {
  type    = bool
  default = true
}

# Output
variable "output_directory" {
  type    = string
  default = "out/packer"
}
variable "output_filename" {
  type    = string
  default = "proxmox-ve-8"
}