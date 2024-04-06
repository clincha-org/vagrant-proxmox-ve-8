# Disable Proxmox enterprise repositories
sed -i "s/^deb/\#deb/" /etc/apt/sources.list.d/pve-enterprise.list
sed -i "s/^deb/\#deb/" /etc/apt/sources.list.d/ceph.list

# Add the Proxmox non-enterprise repository
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list

# Add the Ceph Quincy repository
echo "deb http://download.proxmox.com/debian/ceph-quincy bookworm no-subscription" > /etc/apt/sources.list.d/ceph-no-subscription.list