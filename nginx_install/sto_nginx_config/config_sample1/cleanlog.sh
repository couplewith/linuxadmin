

log_files=`find /usr/local/nginx/logs/ -name "*.log"`


if [ ! -z "$1" ]
then
    echo " >> rm -rf /usr/local/nginx/logs/*.log "
    rm -rf /usr/local/nginx/logs/*.log
else
    
    echo $log_files
    # ------------------------------
    
    for fname in $log_files
    do
       cat /dev/null > $fname
    done
    
fi

ls -al /usr/local/nginx/logs
