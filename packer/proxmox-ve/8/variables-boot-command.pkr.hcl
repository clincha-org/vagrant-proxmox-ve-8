variable "boot_command" {
  type    = list(string)
  default = [
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
    "<end><enter>", # United Kingdom
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
}