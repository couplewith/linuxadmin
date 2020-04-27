setsebool -P rsync_export_all_ro 1

getsebool -a | grep rsync

# postgresql_can_rsync --> off
# rsync_anon_write --> off
# rsync_client --> off
# rsync_export_all_ro --> on
# rsync_full_access --> off
