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
variable "keep_input_artifact" {
  type    = bool
  default = true
}
variable "output" {
  type    = string
  default = "out/vagrant/{{.BuildName}}.box"
}

# vagrant-cloud
variable "box_tag" {
  type    = string
  default = "clincha/proxmox-ve-8"
}
variable "version" {
  type    = string
  default = "dev"
}
variable "access_token" {
  type      = string
  default   = "dummy"
  sensitive = true
}
variable "version_description" {
  type    = string
  default = "Proxmox VE 8 - latest updates"
}