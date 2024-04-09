# vagrant-proxmox-ve-8

This repository contains the code used to create the Vagrant box for Proxmox 8.1 on VirtualBox. The box can be used to test Proxmox in a development environment and then destroyed when no longer needed.

Report any issues or feature requests in the [issues section](https://github.com/clincha-org/vagrant-proxmox-ve-8/issues) of this repository.

## Vagrant Cloud

This box is released to Vagrant Cloud for ease of access.

[clincha](https://app.vagrantup.com/clincha)/[proxmox-ve-8](https://app.vagrantup.com/clincha/boxes/proxmox-ve-8)

## Usage

Ensure you have met the following dependencies:

- Install Oracle VM VirtualBox (https://www.virtualbox.org/wiki/Downloads)
- Install Vagrant (https://www.vagrantup.com/downloads)

### VagrantFile

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "clincha/proxmox-ve-8"
  config.vm.box_version = "1.0.5"
end
```

### CLI

```bash
vagrant init clincha/proxmox-ve-8 --box-version 1.0.5
vagrant up
```

## Using the box

### SSH

You can SSH into the server using the following command:

```bash
vagrant ssh
```

Alternatively, you can run the following command to SSH into the server:

```bash
ssh -p 2222 vagrant@127.0.0.1
``` 

### Web Interface

You can access the Proxmox web interface by navigating to `https://127.0.0.1:8006` in your browser. The default username is `root` and the password is `vagrant`.

![proxmox-gui.png](img/proxmox-gui.png)