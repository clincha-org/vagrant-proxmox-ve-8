variable "boot_command" {
  type    = list(string)
  default = [
    "<down><enter>", # Terminal install
    "<wait1m>", # Wait for DHCP and clock sync
    "<enter>", # Licence accept
    "<wait>",
    "<enter>", # Choose disk
    "<wait>",
    "<up><up><up><enter>", # Choose country
    "<wait>",
    "<end><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><enter>", # United Kingdom
    "<wait>",
    "<down><down><enter>", # Choose keyboard layout
    "<wait>",
    "<end><enter>", # United Kingdom
    "<wait>",
    "<down><enter>", # Complete
    "<wait>",
    "vagrant<down>", # root password
    "vagrant<down>", # root password
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", # delete 'mail@example.invalid'
    "vagrant<leftShiftOn>'<leftShiftOff>localhost.com<down>", # root email 'vagrant@localhost.com'
    "<enter>", # Confirm root credentials
    "<wait>",
    "<enter>", # Confirm network settings
    "<wait>",
    "<right><enter>" # Begin installation
  ]
}