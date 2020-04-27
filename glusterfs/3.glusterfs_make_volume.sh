

cat << EOF

# Step 1
#############################################

# Create Directory
#----------------------------
# Node1 gfs01
# mkdir -p /data/gluster/bricks/1
# mkdir -p /data/gluster/bricks/1/brick

# Node3 gfs02
# mkdir -p /data/gluster/bricks/2
# mkdir -p /data/gluster/bricks/2/brick

# Node3 gfs03
# mkdir -p /data/gluster/bricks/3
# mkdir -p /data/gluster/bricks/3/brick

########################################
gluster peer probe gfs01
gluster peer probe gfs02
gluster peer probe gfs03

gluster pool list

gluster peer status



gluster volume create vol_replica replica 3 transport tcp \
   gfs01:/data/gluster/bricks/1/brick \
   gfs02:/data/gluster/bricks/2/brick \
   gfs03:/data/gluster/bricks/3/brick 

gluster volume create vol_replica_r2 replica 2 transport tcp \
   gfs01:/data/gluster/bricks/1/brick2 \
   gfs02:/data/gluster/bricks/2/brick2 \
   gfs03:/data/gluster/bricks/3/brick2 

 gluster volume list

 gluster volume start vol_replica

 gluster volume status vol_replica
 gluster volume info vol_replica


# Security: From a GlusterFS level, it will allow clients to connect by default :
gluster volume set gfs auth.allow 10.0.0.2,10.0.0.3,10.0.0.4

# Security: would like to remove this rule:
gluster volume set gfs auth.allow *


#>> CMD Examples >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

[root@node1 glusterfs]# gluster pool list
#-------------------------------
UUID                                    Hostname        State
f58ac0da-749a-4fb7-9ee2-cf6a0b8e5888    gfs03           Connected
68c1b17a-1ad0-44d6-b0ac-ef0ee088e0c6    gfs02           Connected
72e0173e-c5f5-4a6e-b3be-61473b84da23    localhost       Connected

#-------------------------------
[root@node1 glusterfs]# gluster peer status
#-------------------------------
Number of Peers: 2

Hostname: gfs03
Uuid: f58ac0da-749a-4fb7-9ee2-cf6a0b8e5888
State: Peer in Cluster (Connected)

Hostname: gfs02
Uuid: 68c1b17a-1ad0-44d6-b0ac-ef0ee088e0c6
State: Peer in Cluster (Connected)


#-------------------------------
[root@node1 glusterfs]# gluster volume create vol_replica replica 3 transport tcp \
>    gfs01:/data/gluster/bricks/1/brick \
>    gfs02:/data/gluster/bricks/2/brick \
>    gfs03:/data/gluster/bricks/3/brick
#-------------------------------
volume create: vol_replica: success: please start the volume to access data

#-------------------------------
[root@node1 glusterfs]# gluster volume list
vol_replica


#-------------------------------
[root@node1 glusterfs]#  gluster volume status vol_replica
Status of volume: vol_replica
Gluster process                             TCP Port  RDMA Port  Online  Pid
------------------------------------------------------------------------------
Brick gfs01:/data/gluster/bricks/1/brick    49152     0          Y       5551
Brick gfs02:/data/gluster/bricks/2/brick    49152     0          Y       5119
Brick gfs03:/data/gluster/bricks/3/brick    49152     0          Y       5017
Self-heal Daemon on localhost               N/A       N/A        Y       5580
Self-heal Daemon on gfs03                   N/A       N/A        Y       5050
Self-heal Daemon on gfs02                   N/A       N/A        Y       5140

Task Status of Volume vol_replica
------------------------------------------------------------------------------
There are no active volume tasks


#-------------------------------
[root@node1 glusterfs]#  gluster volume info vol_replica

Volume Name: vol_replica
Type: Replicate
Volume ID: aeda8e97-f5a9-43d4-a7d6-113ef6018516
Status: Started
Snapshot Count: 0
Number of Bricks: 1 x 3 = 3
Transport-type: tcp
Bricks:
Brick1: gfs01:/data/gluster/bricks/1/brick
Brick2: gfs02:/data/gluster/bricks/2/brick
Brick3: gfs03:/data/gluster/bricks/3/brick
Options Reconfigured:
transport.address-family: inet
nfs.disable: on
performance.client-io-threads: off

