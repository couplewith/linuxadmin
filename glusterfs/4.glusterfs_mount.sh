

Mount the GlusterFS Volume to the Host:


$ echo 'localhost:/gfs /mnt glusterfs defaults,_netdev,backupvolfile-server=localhost 0 0' >> /etc/fstab
$ mount.glusterfs localhost:/gfs /mnt


# mkdir /Vol_GFS
# echo 'localhost:/vol_replica /Vol_GFS glusterfs defaults,_netdev,backupvolfile-server=localhost 0 0' >> /etc/fstab
# mount.glusterfs localhost:/vol_replica /Vol_GFS


#############################################################3
#Example  : find  UUID of FS

[root@node2 ~]# blkid /dev/sdb1
/dev/sdb1: UUID="d6eafaa5-79bd-4010-940d-8ccfec04b041" TYPE="xfs"

# mkdir /Vol_GFS

# cat /etc/fstab
localhost:/vol_replica /Vol_GFS glusterfs defaults,_netdev,backupvolfile-server=localhost 0 0


# mount -a

