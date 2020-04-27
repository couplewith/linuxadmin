    
#* Install Docker CE
## Set up the repository
## Install required packages.
    yum install -y yum-utils device-mapper-persistent-data lvm2
    
### Add Docker repository.
    yum-config-manager --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo
    
## Install Docker CE.
    # yum update -y
    yum install -y \
      containerd.io docker-ce docker-ce-cli
    
## Create /etc/docker directory.
    mkdir /etc/docker
    
 # Setup daemon.
    cat > /etc/docker/daemon.json <<EOF
    {
      "exec-opts": ["native.cgroupdriver=systemd"],
      "log-driver": "json-file",
      "log-opts": {
        "max-size": "100m"
      },
      "storage-driver": "overlay2",
      "storage-opts": [
        "overlay2.override_kernel_check=true"
      ]
    }
EOF
    
    mkdir -p /etc/systemd/system/docker.service.d
    
    # Restart Docker
    systemctl daemon-reload
    systemctl restart docker
