

####################
#Prerequisites
####################

cat > /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

# Setup required sysctl params, these persist across reboots.
cat > /etc/sysctl.d/99-kubernetes-cri.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sysctl --system


########################
# Install containerd
########################

## Set up the repository
### Install required packages
yum install -y yum-utils device-mapper-persistent-data lvm2

### Add docker repository
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

## Install containerd
#yum update -y &&
yum install -y containerd.io

# Configure containerd
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml

# Restart containerd
systemctl restart containerd




###############
#systemd
###############
To use the systemd cgroup driver,
set plugins.cri.systemd_cgroup = true in /etc/containerd/config.toml.
When using kubeadm, manually configure the cgroup driver for kubelet



