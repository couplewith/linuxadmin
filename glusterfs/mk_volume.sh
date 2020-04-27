
cat <<EOF
#gluster volume create vol_replica_r2 replica 3 arbiter 1  transport tcp \

gluster volume create vol_replica_r3 replica 3 arbiter 1 transport tcp \
  gfs01:/data/gluster/bricksr2/1/brick1 \
  gfs02:/data/gluster/bricksr2/2/brick1 \
  gfs03:/data/gluster/bricksr2/3/brick1 \
  gfs01:/data/gluster/bricksr2/1/brick2 \
  gfs02:/data/gluster/bricksr2/2/brick2 \
  gfs03:/data/gluster/bricksr2/3/brick2

gluster volume info vol_replica_r3

gluster volume info vol_replica_r3
gluster volume start vol_replica_r3
gluster volume status vol_replica_r3

EOF

###########################################################3

cat <<EOF
[root@node1 glusterfs]# gluster volume info vol_replica_r3

Volume Name: vol_replica_r3
Type: Distributed-Replicate
Volume ID: 46bbc544-1177-4d57-b762-1ebe1e6ac649
Status: Created
Snapshot Count: 0
Number of Bricks: 2 x (2 + 1) = 6
Transport-type: tcp
Bricks:
Brick1: gfs01:/data/gluster/bricksr2/1/brick1
Brick2: gfs02:/data/gluster/bricksr2/2/brick1
Brick3: gfs03:/data/gluster/bricksr2/3/brick1 (arbiter)
Brick4: gfs01:/data/gluster/bricksr2/1/brick2
Brick5: gfs02:/data/gluster/bricksr2/2/brick2
Brick6: gfs03:/data/gluster/bricksr2/3/brick2 (arbiter)
Options Reconfigured:
transport.address-family: inet
nfs.disable: on
performance.client-io-threads: off

EOF

