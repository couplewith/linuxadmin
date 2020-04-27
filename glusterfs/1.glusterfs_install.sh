
########################################################
cat <<EOF
yum search centos-release-gluster
########################################################

[root@node1 data]# yum search centos-release-gluster
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: ftp.kaist.ac.kr
 * epel: mirror01.idc.hinet.net
 * extras: ftp.kaist.ac.kr
 * updates: ftp.kaist.ac.kr
=============================== N/S matched: centos-release-gluster ================================
centos-release-gluster310.noarch : Gluster 3.10 (Long Term Stable) packages from the CentOS Storage
                                 : SIG repository
centos-release-gluster312.noarch : Gluster 3.12 (Long Term Stable) packages from the CentOS Storage
                                 : SIG repository
centos-release-gluster313.noarch : Gluster 3.13 (Short Term Stable) packages from the CentOS Storage
                                 : SIG repository
centos-release-gluster40.x86_64 : Gluster 4.0 (Short Term Stable) packages from the CentOS Storage
                                : SIG repository

EOF



########################################################
cat <<EOF


# Download PKG
# Caution if not installed centos-release-gluster312. you Cann't download "glusterfs-server" !!
# "centos-release-gluster40" PKG Guide for yum install path.
#

yum install centos-release-gluster312

yumdownloader centos-release-gluster312 centos-release-storage-common 
yumdownloader glusterfs glusterfs-cli glusterfs-libs glusterfs-server

yumdownloader glusterfs-api glusterfs-client-xlators userspace-rcu glusterfs-fuse


# INSTALL  PKG
yum install  glusterfs gluster-cli glusterfs-libs glusterfs-server

# Check addition installed :  glusterfs-api glusterfs-client-xlators userspace-rcu glusterfs-fuse

(1/8): glusterfs-api-3.12.9-1.el7.x86_64.rpm                                 |  98 kB  00:00:01
(2/8): glusterfs-cli-3.12.9-1.el7.x86_64.rpm                                 | 198 kB  00:00:01
(3/8): glusterfs-3.12.9-1.el7.x86_64.rpm                                     | 558 kB  00:00:06
(4/8): glusterfs-fuse-3.12.9-1.el7.x86_64.rpm                                | 142 kB  00:00:01
(5/8): glusterfs-client-xlators-3.12.9-1.el7.x86_64.rpm                      | 862 kB  00:00:05
(6/8): glusterfs-libs-3.12.9-1.el7.x86_64.rpm                                | 399 kB  00:00:02
(7/8): userspace-rcu-0.10.0-3.el7.x86_64.rpm                                 |  93 kB  00:00:00
(8/8): glusterfs-server-3.12.9-1.el7.x86_64.rpm                              | 1.2 MB  00:00:04

EOF


########################################################
cat <<EOF
# startup settings
systemctl enable glusterd
systemctl start glusterd
systemctl status glusterd


# rpcbind 
systemctl enable rpcbind
systemctl start rpcbind
systemctl status rpcbind


EOF
