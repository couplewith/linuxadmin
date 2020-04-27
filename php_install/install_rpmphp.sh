
mkdir php_src
cd php_src

. /etc/rc.d/init.d/functions
# ***************************************
  echo " >> GET PHP-SRC "
# ***************************************

## --------------------------------------------------
yum -y install re2c libmcrypt libmcrypt-devel;
yum -y install  net-snmp  net-snmp-devel
yum -y install  gd gd-devel libpng openjpeg openjpeg-devel libpng-devel libxml2  libxml2-devel

yum -y install  php php-cli php-common php-fpm php-gd php-mbstring php-mysql php-pear php-xml php-dba php-intl

ls -al /usr/lib/systemd/system/php-fpm*
systemctl status php-fpm
systemctl enable php-fpm
