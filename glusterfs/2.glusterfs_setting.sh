
# Step 1
#############################################
cat << EOF
# mkfs.xfs /dev/sdb1
# mount -t xfs /dev/sdb1 /data
EOF

# Step 2
#############################################
# Add Hosts (/etc/hosts)
#----------------------------
cat << EOF
# Add /etc/hosts :
192.168.75.4  node1.im.com  node1
192.168.75.5  node2.im.com  node2
192.168.75.6  node3.im.com  node3

192.168.75.4   gfs01
192.168.75.5   gfs02
192.168.75.6   gfs03
EOF

# Step 3
#############################################
# mkdir -p /data/gluster/bricks/1~3

cat <<EOF
# > node: gfs01
$ mkdir /data/gluster/bricks/1 -p
$ echo '/dev/vdb /data/gluster/bricks/1 xfs defaults 0 0' >> /etc/fstab
$ mount -a
$ mkdir /data/data/gluster/bricks/1/brick

# > node: gfs02
$ mkdir /data/gluster/bricks/2 -p
$ echo '/dev/vdb /data/gluster/bricks/2 xfs defaults 0 0' >> /etc/fstab
$ mount -a
$ mkdir /data/gluster/bricks/2/brick

# > node: gfs03
$ mkdir /data/gluster/bricks/3 -p
$ echo '/dev/vdb /data/gluster/bricks/3 xfs defaults 0 0' >> /etc/fstab
$ mount -a
$ mkdir /data/gluster/bricks/3/brick

EOF

# Step 4
###############################################
cat << EOF

# Step4 : startup and probe


systemctl enable glusterfs-server
or 
systemctl enable  glusterd


systemctl status glusterd
systemctl start glusterd

gluster peer probe gfs03

#---------------------------------------------------------

[root@node1 glusterfs]#  gluster peer probe gfs03
peer probe: success.
[root@node1 glusterfs]#  gluster peer probe gfs02
peer probe: success.

[root@node1 glusterfs]# gluster peer status
Number of Peers: 2

Hostname: gfs03
Uuid: f58ac0da-749a-4fb7-9ee2-cf6a0b8e5888
State: Peer in Cluster (Connected)

Hostname: gfs02
Uuid: 68c1b17a-1ad0-44d6-b0ac-ef0ee088e0c6
State: Peer in Cluster (Connected)

EOF






