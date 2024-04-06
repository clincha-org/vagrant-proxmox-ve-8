# vagrant
variable "vagrantfile_template" {
  type    = string
  default = "vagrant/Vagrantfile"
}
variable "compression_level" {
  type    = number
  default = 9
}
variable "include" {
  type    = list(string)
  default = [
    "vagrant/info.json"
  ]
}

# vagrant-cloud
variable "box_tag" {
  type    = string
  default = "clincha/proxmox-ve-8"
}
variable "version" {
  type = string
}
variable "access_token" {
  type      = string
  sensitive = true
}
variable "version_description" {
  type    = string
  default = "Proxmox VE 8 - latest updates"
}