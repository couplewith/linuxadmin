
if [ -z "$1" ]
then
     OPTIONS=" -n "
fi

rsync -ar --progress $OPTIONS    192.168.56.101::NGINX_CONF  /usr/local/nignx 


echo "> rsync -ar --progress $OPTIONS    192.168.56.101::NGINX_CONF  /usr/local/nignx  "


