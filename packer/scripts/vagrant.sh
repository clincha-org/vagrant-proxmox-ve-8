# Vagrant configuration
# See: https://developer.hashicorp.com/vagrant/docs/boxes/base

# Add vagrant user
adduser vagrant --verbose --comment "Vagrant User" --disabled-password
echo "vagrant:vagrant" | chpasswd

# Create vagrant ssh directory
mkdir /home/vagrant/.ssh

# Add vagrant insecure public keys
curl -sL https://raw.githubusercontent.com/hashicorp/vagrant/main/keys/vagrant.pub.rsa >> /home/vagrant/.ssh/authorized_keys
curl -sL https://raw.githubusercontent.com/hashicorp/vagrant/main/keys/vagrant.pub.ed25519 >> /home/vagrant/.ssh/authorized_keys

# Set permissions
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Install sudo
apt-get update
apt-get install -y sudo

# Add vagrant user to sudoers
echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant

# Set UseDNS to no in sshd_config
sed -i "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config