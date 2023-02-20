 dataDir="/data/MariaDB"
 getenforce
 semanage fcontext -a -t mysqld_db_t "${dataDir}(/.*)?"
 restorecon -Rv ${dataDir}
 chcon -R -u system_u -r object_r -t mysqld_db_t ${dataDir}
 ls -lh -Zd ${dataDir}

# semodule -i my-mysqld.pp
